# Copilot Workflow (Automation Mode)

Alles klar — hier ist die production-grade Version: robuste Patch-Extraktion, Retry mit Fehler-Feedback, smarter Task-Scheduler (Deps/BLOCKED), optional Branch pro Task, optional Review-Report Patch.

Ich gebe dir das als „Copy-Paste-Set“ (Dateien + Code). Du kannst es 1:1 übernehmen.

---

## A) Konventionen, die Automatisierung stabil machen

### 1) Task-Format (Deps & Status)

Erweitere dein tasks.md pro Task um Dependencies (T-IDs) und optional Ready-Flag:

```markdown
### T-003 — Add login endpoint
- Status: TODO
- Goal: ...
- Dependencies: T-001, T-002
- Acceptance Criteria:
  - ...
- Required Tests:
  - ...
```

Der Orchestrator setzt automatisch `BLOCKED`, wenn Dependencies nicht `DONE` sind.

### 2) „Patch-only“ Contract (hart)

Copilot muss wirklich diff-only liefern. Wir erzwingen Marker und extrahieren robust.

---

## B) Prompts (AUTOMATION MODE) – bitte so speichern

`scripts/prompts/04_implementer_task_auto.md`

```markdown
ROLE: Implementer (AUTOMATION MODE)

You MUST output ONLY a SINGLE unified diff patch between markers.
No explanations. No markdown fences. No extra text.

The patch must apply cleanly with: git apply --3way

Context files (read only):
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (TASK <TASK_ID>)
- repository code

Task:
Implement TASK <TASK_ID> for feature <FEATURE>.

OUTPUT FORMAT EXACTLY:
[BEGIN PATCH]
<unified diff>
[END PATCH]
```

`scripts/prompts/05_tester_task_auto.md`

```markdown
ROLE: Tester (AUTOMATION MODE)

You MUST output ONLY a SINGLE unified diff patch between markers.
No explanations. No markdown fences. No extra text.

The patch must apply cleanly with: git apply --3way

Context files (read only):
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (TASK <TASK_ID>)
- repository tests

Task:
Add/extend tests that prove the acceptance criteria for TASK <TASK_ID>.

OUTPUT FORMAT EXACTLY:
[BEGIN PATCH]
<unified diff>
[END PATCH]
```

Optional: `scripts/prompts/06_reviewer_auto.md`

Reviewer schreibt nur review.md als Patch:

```markdown
ROLE: Reviewer (AUTOMATION MODE)

You MUST output ONLY a SINGLE unified diff patch between markers.
No explanations. No markdown fences. No extra text.

Context:
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md
- current git diff

Task:
Write a spec-driven review into: specs/features/<FEATURE>/review.md

Include:
- Summary (pass/fail + why)
- Findings: BLOCKER/MAJOR/MINOR
- Missing tests/docs
- Follow-ups

OUTPUT FORMAT EXACTLY:
[BEGIN PATCH]
<unified diff>
[END PATCH]
```


---

## C) Orchestrator (robust) – `scripts/auto_workflow.py`

Features:

- task scheduling mit Dependencies
- retry wenn `git apply` oder Gates failen (inkl. Fehlertext an Copilot)
- branch per task optional
- review step optional
- log file pro run

```python
#!/usr/bin/env python3
import os, re, subprocess, sys, time
from dataclasses import dataclass
from pathlib import Path
from typing import List, Optional, Tuple

ROOT = Path(__file__).resolve().parents[1]
FEATURES_DIR = ROOT / "specs" / "features"
PROMPTS_DIR = ROOT / "scripts" / "prompts"
GATES_DIR = ROOT / "scripts" / "gates"
LOG_DIR = ROOT / ".ai_runs"
LOG_DIR.mkdir(exist_ok=True)

BEGIN = "[BEGIN PATCH]"
END   = "[END PATCH]"

@dataclass
class Task:
    task_id: str
    title: str
    status: str
    deps: List[str]

def run(cmd: List[str], check=True, capture=False) -> subprocess.CompletedProcess:
    return subprocess.run(
        cmd,
        cwd=str(ROOT),
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.PIPE if capture else None,
        text=True,
        check=check,
    )

def git_clean_required():
    r = run(["git", "status", "--porcelain"], capture=True)
    if r.stdout.strip():
        raise SystemExit("Working tree not clean. Commit/stash first.")

def read_text(p: Path) -> str:
    return p.read_text(encoding="utf-8")

def write_text(p: Path, txt: str):
    p.write_text(txt, encoding="utf-8")

def parse_tasks(tasks_md: str) -> List[Task]:
    tasks: List[Task] = []
    header_re = re.compile(r"^###\s+(T-\d+)\s+—\s+(.*)$", re.M)
    for m in header_re.finditer(tasks_md):
        tid = m.group(1).strip()
        title = m.group(2).strip()
        block = tasks_md[m.end(): m.end() + 1200]

        sm = re.search(r"-\s*Status:\s*(TODO|DOING|BLOCKED|DONE|FAILED)\b", block)
        status = sm.group(1) if sm else "TODO"

        dm = re.search(r"-\s*Dependencies:\s*(.*)$", block, re.M)
        deps = []
        if dm:
            raw = dm.group(1).strip()
            if raw.lower() not in ("none", "-", ""):
                deps = [d.strip() for d in raw.split(",") if d.strip()]

        tasks.append(Task(tid, title, status, deps))
    return tasks

def set_task_status(feature: str, task_id: str, new_status: str):
    p = FEATURES_DIR / feature / "tasks.md"
    txt = read_text(p)
    pattern = re.compile(
        rf"(###\s+{re.escape(task_id)}\s+—[^\n]*\n(?:.*\n){{0,60}}?- Status:\s*)(TODO|DOING|BLOCKED|DONE|FAILED)",
        re.M
    )
    txt2, n = pattern.subn(rf"\1{new_status}", txt, count=1)
    if n == 0:
        raise RuntimeError(f"Could not update status for {task_id}")
    write_text(p, txt2)

def update_blocked_by_deps(feature: str, tasks: List[Task]):
    done = {t.task_id for t in tasks if t.status == "DONE"}
    for t in tasks:
        if t.status in ("DONE", "FAILED"):
            continue
        if any(dep not in done for dep in t.deps):
            if t.status != "BLOCKED":
                set_task_status(feature, t.task_id, "BLOCKED")
        else:
            if t.status == "BLOCKED":
                set_task_status(feature, t.task_id, "TODO")

def choose_next_task(tasks: List[Task]) -> Optional[Task]:
    # pick first TODO that has all deps done (after update_blocked_by_deps)
    for t in tasks:
        if t.status == "TODO" and not t.deps:
            return t
    for t in tasks:
        if t.status == "TODO" and t.deps:
            return t
    # allow resuming DOING
    for t in tasks:
        if t.status == "DOING":
            return t
    return None

def load_prompt(name: str, feature: str, task_id: str, extra_context: str = "") -> str:
    prompt = read_text(PROMPTS_DIR / name)
    prompt = prompt.replace("<FEATURE>", feature).replace("<TASK_ID>", task_id)
    if extra_context:
        prompt += "\n\n---\n\nAUTOMATION FEEDBACK:\n" + extra_context.strip() + "\n"
    return prompt

def copilot(prompt: str, agent: Optional[str], log_path: Path) -> str:
    # Uses github/copilot-cli reference flags:
    # --prompt / --silent / --no-ask-user / --allow-all-tools / --add-dir / --agent
    cmd = [
        "copilot",
        "--prompt", prompt,
        "--silent",
        "--no-ask-user",
        "--allow-all-tools",
        "--add-dir", str(ROOT),
        "--no-color",
    ]
    if agent:
        cmd += ["--agent", agent]

    p = subprocess.run(cmd, cwd=str(ROOT), stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    out = p.stdout or ""
    err = p.stderr or ""

    log_path.write_text(
        f"$ {' '.join(cmd)}\n\n--- STDOUT ---\n{out}\n\n--- STDERR ---\n{err}\n",
        encoding="utf-8"
    )

    if p.returncode != 0:
        raise RuntimeError(f"copilot returned {p.returncode}:\n{err.strip()}")

    return out

def extract_patch(text: str) -> str:
    # robust extraction: accept if markers exist; otherwise try to detect a diff block.
    if BEGIN in text and END in text:
        patch = text.split(BEGIN, 1)[1].split(END, 1)[0]
        patch = patch.strip("\n") + "\n"
        return patch

    # fallback: detect unified diff
    m = re.search(r"(^diff --git .*?$)", text, re.M)
    if m:
        patch = text[m.start():].strip("\n") + "\n"
        return patch

    raise RuntimeError("Could not extract a patch (no markers, no diff --git found).")

def apply_patch(patch: str) -> Tuple[bool, str]:
    tmp = ROOT / ".tmp_copilot.patch"
    write_text(tmp, patch)
    try:
        p = subprocess.run(["git", "apply", "--3way", str(tmp)],
                           cwd=str(ROOT), stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if p.returncode == 0:
            return True, ""
        return False, p.stderr.strip()
    finally:
        tmp.unlink(missing_ok=True)

def run_gates() -> Tuple[bool, str]:
    for gate in ["format.sh", "lint.sh", "test.sh"]:
        path = GATES_DIR / gate
        if path.exists() and os.access(path, os.X_OK):
            p = subprocess.run([str(path)], cwd=str(ROOT),
                               stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            if p.returncode != 0:
                msg = (p.stdout or "") + "\n" + (p.stderr or "")
                return False, msg.strip()
    return True, ""

def create_branch(feature: str, task_id: str):
    branch = f"ai/{feature}/{task_id}".replace(" ", "-")
    run(["git", "checkout", "-b", branch], check=True)

def main():
    if len(sys.argv) < 2:
        print("Usage: scripts/auto_workflow.py <feature> [--max N] [--branch-per-task] [--review] [--retries N]")
        raise SystemExit(2)

    feature = sys.argv[1]
    max_tasks = None
    retries = 2
    branch_per_task = "--branch-per-task" in sys.argv
    do_review = "--review" in sys.argv

    if "--max" in sys.argv:
        max_tasks = int(sys.argv[sys.argv.index("--max")+1])
    if "--retries" in sys.argv:
        retries = int(sys.argv[sys.argv.index("--retries")+1])

    git_clean_required()

    tasks_path = FEATURES_DIR / feature / "tasks.md"
    if not tasks_path.exists():
        raise SystemExit(f"Missing: {tasks_path}")

    count = 0
    while True:
        tasks = parse_tasks(read_text(tasks_path))
        update_blocked_by_deps(feature, tasks)
        tasks = parse_tasks(read_text(tasks_path))  # re-read after updates

        next_task = choose_next_task(tasks)
        if not next_task:
            break

        if max_tasks is not None and count >= max_tasks:
            break

        t = next_task
        print(f"\n=== {t.task_id}: {t.title} (deps: {', '.join(t.deps) or 'none'}) ===")

        # Create branch if desired
        if branch_per_task:
            create_branch(feature, t.task_id)

        set_task_status(feature, t.task_id, "DOING")
        run(["git", "add", str(tasks_path)], check=True)
        run(["git", "commit", "-m", f"{feature}: set {t.task_id} DOING"], check=True)

        # Two-stage: implementer then tester, each with retries on apply/gates
        stage_specs = [
            ("implementer", "04_implementer_task_auto.md", "implementer"),
            ("tester",      "05_tester_task_auto.md",      "tester"),
        ]

        extra = ""
        for stage_name, prompt_file, agent in stage_specs:
            attempt = 0
            while True:
                attempt += 1
                log_path = LOG_DIR / f"{feature}_{t.task_id}_{stage_name}_attempt{attempt}.log"
                prompt = load_prompt(prompt_file, feature, t.task_id, extra_context=extra)

                out = copilot(prompt, agent=agent, log_path=log_path)
                patch = extract_patch(out)

                ok, err = apply_patch(patch)
                if ok:
                    extra = ""
                    break

                extra = f"git apply failed.\nERROR:\n{err}\n\nPlease produce a corrected patch."
                if attempt > retries:
                    set_task_status(feature, t.task_id, "FAILED")
                    raise SystemExit(f"{stage_name} failed to produce an applicable patch after {retries} retries. See logs in {LOG_DIR}")

        # Gates with retry feedback to tester (optional)
        attempt = 0
        while True:
            attempt += 1
            ok, gate_err = run_gates()
            if ok:
                break
            if attempt > retries:
                set_task_status(feature, t.task_id, "FAILED")
                raise SystemExit(f"Gates failed after {retries} retries.\n{gate_err}")

            # Ask tester to fix gate failures
            log_path = LOG_DIR / f"{feature}_{t.task_id}_fixgates_attempt{attempt}.log"
            prompt = load_prompt("05_tester_task_auto.md", feature, t.task_id,
                                 extra_context=f"Local gates failed.\nERROR:\n{gate_err}\n\nFix code/tests and return patch.")
            out = copilot(prompt, agent="tester", log_path=log_path)
            patch = extract_patch(out)
            ok2, err2 = apply_patch(patch)
            if not ok2:
                # continue loop; will retry again with apply error
                pass

        # Mark DONE + commit
        set_task_status(feature, t.task_id, "DONE")
        run(["git", "add", "-A"], check=True)
        run(["git", "commit", "-m", f"{feature}: complete {t.task_id}"], check=True)

        count += 1

    if do_review:
        # Reviewer writes review.md as patch
        log_path = LOG_DIR / f"{feature}_review.log"
        prompt = read_text(PROMPTS_DIR / "06_reviewer_auto.md").replace("<FEATURE>", feature).replace("<TASK_ID>", "N/A")
        out = copilot(prompt, agent="reviewer", log_path=log_path)
        patch = extract_patch(out)
        ok, err = apply_patch(patch)
        if not ok:
            raise SystemExit(f"Review patch failed to apply:\n{err}")
        run(["git", "add", "-A"], check=True)
        run(["git", "commit", "-m", f"{feature}: add review report"], check=True)

    print("\n✅ Orchestration finished.")

if __name__ == "__main__":
    main()
```
Setup:

```bash
chmod +x scripts/auto_workflow.py
chmod +x scripts/gates/*.sh
```

Run:

```bash
./scripts/auto_workflow.py user-login --max 5 --retries 2 --branch-per-task --review
```

Logs landen in .ai_runs/… (stdout/stderr der Copilot-Calls).

⸻


E) Was jetzt wirklich “automatisiert” ist
	•	Scheduler nimmt nächsten READY Task (Deps erfüllt)
	•	ruft Copilot non-interactive (--prompt --silent --no-ask-user)
	•	wendet Patch an (git apply --3way)
	•	repariert automatisch bei Apply/Gate Fehlern (retry + error feedback)
	•	committet pro Task (optionaler Branch pro Task)
	•	optionaler Review-Patch am Ende

Das ist echte Orchestrierung als State Machine.

⸻
