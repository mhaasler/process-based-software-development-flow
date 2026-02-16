# Lokaler Multi-Agent-KI-Workflow (GitHub Copilot only)

Ziel: Ein vollständig lokaler, generischer Workflow für umfangreiche Softwareentwicklung – von Architektur & Spezifikation bis Implementierung und Pull‑Request‑Review – ohne zusätzliche kostenpflichtige Tools, ausschließlich mit GitHub Copilot.

Dieser Ansatz ist repo‑basiert, reproduzierbar und framework‑agnostisch. Er setzt bewusst keine Web‑UI, keine externen SaaS‑Agenten und keine CI‑Pflicht voraus.

---

## 1. Grundprinzipien

1. **Local-only**  
    Alle Entscheidungen, Prompts, Regeln und Outputs liegen im Repository. Keine Abhängigkeit von Chat-Historien.
2. **Spec as Source of Truth**  
    Spezifikationen beschreiben das System. Code implementiert die Specs. Code ist niemals selbst die Spezifikation.
3. **Agenten sind Rollen, keine Magie**  
    Jeder Agent hat:
    - klaren Verantwortungsbereich
    - definiertes Output-Format
    - explizite Übergabepunkte (Handoffs)
4. **Deterministische Qualitätsschranken (Gates)**  
    Ein Task gilt nur als „fertig“, wenn lokale Gates (Tests, Lint, Format, Schema, Doku) erfüllt sind.
5. **Kein implizites Wissen**  
    Alles, was wichtig ist, steht in Dateien: Specs, Instructions, Agent-Profile.

---

## 2. Zielarchitektur des Workflows

┌─────────────┐
│   Specs     │  ← Architektur, Regeln, Invarianten
└─────┬───────┘
      │
┌─────▼───────┐
│   Planner   │  ← Zerlegung in Tasks
└─────┬───────┘
      │
┌─────▼───────┐
│ Implementer │  ← Code
└─────┬───────┘
      │
┌─────▼───────┐
│   Tester    │  ← Tests & Validierung
└─────┬───────┘
      │
┌─────▼───────┐
│  Reviewer   │  ← Review gegen Specs & Regeln
└─────────────┘

Orchestrierung erfolgt lokal über:

- VS Code + Copilot Chat
- GitHub Copilot CLI (Terminal)
- einfache Shell-Skripte / Makefile / justfile

⸻

## 3. Repository-Struktur (empfohlen)

.
├─ specs/
│  ├─ constitution.md
│  ├─ architecture/
│  │  ├─ context.md
│  │  ├─ adr-001-*.md
│  └─ features/
│     └─ <feature>/
│        ├─ spec.md
│        ├─ plan.md
│        └─ tasks.md
│
├─ .github/
│  ├─ copilot-instructions.md
│  ├─ instructions/
│  │  ├─ review.instructions.md
│  │  └─ language.instructions.md
│  └─ agents/
│     ├─ architect.agent.md
│     ├─ planner.agent.md
│     ├─ implementer.agent.md
│     ├─ tester.agent.md
│     └─ reviewer.agent.md
│
├─ scripts/
│  ├─ workflow.sh
│  └─ gates/
│     ├─ format.sh
│     ├─ lint.sh
│     └─ test.sh
│
├─ Makefile / justfile
└─ README.md


⸻

4. Die Agenten (generisch)

4.1 Architect Agent

Aufgabe:
	•	System‑ & Komponentenarchitektur
	•	Schnittstellen & Boundaries
	•	Invarianten, Risiken, Trade‑offs

Input:
	•	specs/constitution.md
	•	Feature‑Spec

Output:
	•	Architekturabschnitt
	•	ADR(s)
	•	explizite Annahmen

⸻

4.2 Planner Agent

Aufgabe:
	•	Architektur → umsetzbare Arbeit zerlegen

Output pro Task:
	•	Ziel
	•	Akzeptanzkriterien
	•	Testanforderungen
	•	Abhängigkeiten

⸻

4.3 Implementer Agent

Aufgabe:
	•	Umsetzung einzelner Tasks

Regeln:
	•	kleine, reviewbare Änderungen
	•	kein Architekturentscheid ohne Spec‑Änderung

⸻

4.4 Tester Agent

Aufgabe:
	•	Tests definieren oder erweitern
	•	Edge‑Cases und Regressionen identifizieren

Definition of Done:
	•	Tests reproduzieren das Akzeptanzkriterium

⸻

4.5 Reviewer Agent

Aufgabe:
	•	Review gegen Specs, nicht gegen Bauchgefühl

Checkliste:
	•	verletzt der Code Constitution?
	•	fehlen Tests?
	•	implizite Annahmen?
	•	Abweichungen von Architektur?

⸻

5. Custom Instructions (Repo‑weit)

.github/copilot-instructions.md

Enthält:
	•	Projektprinzipien
	•	Coding‑Regeln
	•	Test‑Pflichten
	•	Dokumentationspflichten

.github/instructions/review.instructions.md

Mit applyTo:
	•	erzwingt Review‑Struktur
	•	standardisiert Review‑Kommentare

⸻

6. Spec‑Driven Flow (lokal)
	1.	Spec erstellen (spec.md)
	2.	Plan ableiten (plan.md)
	3.	Tasks definieren (tasks.md)
	4.	Task‑Iteration:
	•	Implementer
	•	Tester
	•	Reviewer
	5.	Pull Request
	6.	Copilot Review + manueller Review

Regel: Codeänderungen ohne Spec‑Änderung sind Ausnahmefälle und müssen begründet werden.

⸻

7. Lokale Orchestrierung

7.1 Workflow‑Skript (Beispielidee)

Ein simples workflow.sh kann:
	•	Phasen starten
	•	relevante Dateien öffnen
	•	Copilot CLI mit vorbereiteten Prompts aufrufen

Keine Magie – nur Struktur.

⸻

8. Qualitätsschranken (Gates)

Empfohlen:
	•	Format
	•	Lint
	•	Tests
	•	Schema‑Validierung
	•	Docs‑Check

Wichtig: Gates sind lokal ausführbar und agent‑neutral.

⸻

9. Warum keine eigene UI?
	•	VS Code + Terminal sind bereits die effektivste UI
	•	Jede zusätzliche UI erhöht Wartung & implizite Logik
	•	Repo‑Struktur ist langlebiger als Tools

Eine eigene UI lohnt sich nur, wenn ein reales UX‑Problem besteht.

⸻

10. Kernaussage

Ein guter KI‑Workflow entsteht nicht durch mehr Agenten, sondern durch klare Rollen, explizite Regeln und harte Übergabepunkte.

GitHub Copilot ist dabei Ausführer, nicht Architekt.
Die Architektur liegt im Repository.

⸻

11. Custom Agents (Dateien für .github/agents/*.agent.md)

Diese Agent-Profile sind so geschrieben, dass sie automations-tauglich sind:
	•	Sie erzwingen Diff-only Output (Patch zwischen Markern)
	•	Sie vermeiden Rückfragen (keine „Fragen stellen“, sondern Annahmen + offene Punkte als TODO im Spec/Plan)
	•	Sie arbeiten strikt datei-basiert (Spec/Plan/Tasks als Source of Truth)

Lege die folgenden Dateien exakt so an. (Agent-Name = Dateiname ohne .agent.md.)

.github/agents/architect.agent.md

---
name: architect
description: Spec & Architektur (SDD). Erstellt/aktualisiert Spec/Plan/ADRs. Diff-only in Automation Mode.
---

You are the **Architect** agent.

## Core rules
- Specs are the source of truth. Code implements specs.
- If anything is ambiguous, **do not ask questions**; instead:
  - write explicit assumptions into the spec/plan
  - add an “Open Questions” section
- Prefer minimal, verifiable architecture.

## Output contract
If the user request contains the phrase **AUTOMATION MODE**, you MUST output **ONLY** a single unified diff patch between markers:

[BEGIN PATCH]
<unified diff>
[END PATCH]

No explanations, no markdown fences, no extra text.

Otherwise, provide a structured spec/plan/ADR proposal in plain text.

## Typical files
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/architecture/adr-*.md

## What you produce
- Clear problem framing, scope, invariants, acceptance criteria
- Architecture notes, boundaries, contract changes, risks
- Explicit test strategy linked to acceptance criteria

.github/agents/planner.agent.md

---
name: planner
description: Zerlegt Plan in Tasks (klein, reviewbar) inkl. AC, Tests, Dependencies. Diff-only in Automation Mode.
---

You are the **Planner** agent.

## Core rules
- Convert plan → tasks that are small and independently reviewable.
- Every acceptance criterion must map to tests.
- Use explicit Dependencies: T-001, T-002, ...

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

## Typical files
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md

## Task template requirements
Each task must include:
- Status (TODO/DOING/BLOCKED/DONE/FAILED)
- Goal
- Acceptance Criteria (testable)
- Required Tests
- Likely Areas/Files
- Dependencies

.github/agents/implementer.agent.md

---
name: implementer
description: Implementiert genau einen Task, klein & reviewbar. Diff-only in Automation Mode.
---

You are the **Implementer** agent.

## Core rules
- Implement ONLY what the selected task demands.
- Keep PR-size changes. Avoid refactors unless required by task.
- If you must deviate from spec/plan, STOP and produce a spec/plan patch first.

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

No extra text.

## Typical inputs
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (TASK <TASK_ID>)

## Deliverable
- Code changes (minimal)
- Updates to docs if required by task
- No task status changes unless explicitly requested (some orchestrators do it themselves)

.github/agents/tester.agent.md

---
name: tester
description: Ergänzt/erstellt Tests, behebt Gate-Failures. Diff-only in Automation Mode.
---

You are the **Tester** agent.

## Core rules
- Tests must prove acceptance criteria.
- Prefer deterministic, stable tests.
- When gates fail, fix the minimal set of issues.

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

No extra text.

## Typical inputs
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (TASK <TASK_ID>)
- Gate error logs (if provided)

## Deliverable
- Tests added/updated
- Minimal fixes to make gates pass

.github/agents/reviewer.agent.md

---
name: reviewer
description: Spec-driven Review, schreibt Findings in review.md. Diff-only in Automation Mode.
---

You are the **Reviewer** agent.

## Core rules
- Review against specs/constitution first, code second.
- Findings must be actionable.
- Classify severity: BLOCKER / MAJOR / MINOR.

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

No extra text.

## Typical inputs
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md
- current git diff / PR changes
- specs/features/<FEATURE>/review.md

## Deliverable
- A review report in `specs/features/<FEATURE>/review.md`
- Clear pass/fail summary + findings + missing tests/docs


⸻

12. Empfehlung für den ersten Testlauf
	1.	Lege die Agent-Dateien an (.github/agents/*.agent.md).
	2.	Lege die Auto-Prompts an (scripts/prompts/*_auto.md).
	3.	Stelle sicher, dass deine Gates wirklich ausführbar sind (chmod +x scripts/gates/*.sh).
	4.	Starte einen Run auf einem kleinen Feature:

./scripts/auto_workflow.py user-login --max 1 --retries 2 --branch-per-task --review

Wenn der Copilot Output nicht strikt diff-only ist, ist der Prompt-Contract (Marker + „no extra text“) der Hebel.


# Bootstrap-Skript, das alle Dateien automatisch anlegt (scripts/bootstrap_ai_workflow.sh), inkl. chmod +x, Template-Feature und minimaler constitution.md

So nutzt du es:
1. Lege die Datei an: scripts/bootstrap_ai_workflow.sh
2. Ausführen:

`bash scripts/bootstrap_ai_workflow.sh`

3. Feature anlegen:

```bash
FEATURE=user-login
mkdir -p "specs/features/$FEATURE"
cp specs/features/TEMPLATE/* "specs/features/$FEATURE/"
```

4. spec.md, plan.md, tasks.md ausfüllen (einmalig)
5. Orchestrator laufen lassen:

`./scripts/auto_workflow.py user-login --max 1 --retries 2 --branch-per-task --review`

```bash
#!/usr/bin/env bash
set -euo pipefail

# Bootstrap a local-only Copilot multi-agent workflow scaffold.
# Run from repo root:
#   bash scripts/bootstrap_ai_workflow.sh
#
# Or copy-paste this whole file into: scripts/bootstrap_ai_workflow.sh and run it.

ROOT="$(pwd)"

mkdir -p \
  "$ROOT/.github/agents" \
  "$ROOT/.github/instructions" \
  "$ROOT/scripts/gates" \
  "$ROOT/scripts/prompts" \
  "$ROOT/specs/architecture" \
  "$ROOT/specs/features/TEMPLATE" \
  "$ROOT/.ai_runs"

# ----------------------------
# 1) Constitution (minimal)
# ----------------------------
cat > "$ROOT/specs/constitution.md" <<'EOF'
# Constitution (Non-Negotiables)

## Specs are the source of truth
- Specs describe the system.
- Code implements specs.
- Code is never the spec.

## Change discipline
- Any behavioral change requires updating the relevant spec/plan/tasks first (or in the same change).
- If an implementation deviates, document it explicitly in the spec/plan.

## Quality gates (local)
- Changes are done only if local gates pass:
  - formatting
  - lint/static analysis
  - tests

## Review discipline
- Reviews are spec-driven (constitution/spec/plan/tasks first, code second).
- Findings must be actionable, classified as: BLOCKER / MAJOR / MINOR.
EOF

# ----------------------------
# 2) Feature templates
# ----------------------------
cat > "$ROOT/specs/features/TEMPLATE/spec.md" <<'EOF'
# Feature Spec: TODO_FILL

## Problem
TODO_FILL

## Scope
- TODO_FILL

## Non-Goals
- TODO_FILL

## Behavior (externally observable)
TODO_FILL

## Invariants
- TODO_FILL

## Interfaces / Boundaries (high-level)
TODO_FILL

## Risks / Open Questions
- TODO_FILL

## Acceptance Criteria
- TODO_FILL
EOF

cat > "$ROOT/specs/features/TEMPLATE/plan.md" <<'EOF'
# Feature Plan: TODO_FILL

## Architecture Notes
TODO_FILL

## Interface / Contract Changes
TODO_FILL

## Data Model Changes
TODO_FILL

## Step-by-step Strategy
1. TODO_FILL

## Observability Expectations
TODO_FILL

## Test Strategy
TODO_FILL

## Risks & Mitigations
TODO_FILL
EOF

cat > "$ROOT/specs/features/TEMPLATE/tasks.md" <<'EOF'
# Feature Tasks: TODO_FILL

## Task List

### T-001 — TODO_FILL
- Status: TODO
- Goal: TODO_FILL
- Dependencies: None
- Acceptance Criteria:
  - TODO_FILL
- Required Tests:
  - TODO_FILL
- Likely Areas/Files:
  - TODO_FILL

<!-- Copy/paste blocks for more tasks -->
EOF

cat > "$ROOT/specs/features/TEMPLATE/review.md" <<'EOF'
# Feature Review: TODO_FILL

## Summary
TODO_FILL

## Findings
- [SEVERITY] TODO_FILL

## Missing Tests / Docs
- TODO_FILL

## Follow-ups
- TODO_FILL
EOF

# ----------------------------
# 3) Gates (placeholders)
# ----------------------------
cat > "$ROOT/scripts/gates/format.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "FORMAT gate placeholder (wire to your formatter)"
# examples:
# cargo fmt --check
# npm run format:check
# dart format --output=none --set-exit-if-changed .
EOF

cat > "$ROOT/scripts/gates/lint.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "LINT gate placeholder (wire to your linter)"
# examples:
# cargo clippy --all-targets --all-features -- -D warnings
# npm run lint
# dart analyze
EOF

cat > "$ROOT/scripts/gates/test.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "TEST gate placeholder (wire to your test runner)"
# examples:
# cargo test
# npm test
# flutter test
EOF

chmod +x "$ROOT/scripts/gates/"*.sh

# ----------------------------
# 4) Automation prompts (Diff-only)
# ----------------------------
cat > "$ROOT/scripts/prompts/04_implementer_task_auto.md" <<'EOF'
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
EOF

cat > "$ROOT/scripts/prompts/05_tester_task_auto.md" <<'EOF'
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
EOF

cat > "$ROOT/scripts/prompts/06_reviewer_auto.md" <<'EOF'
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
EOF

# ----------------------------
# 5) Custom Agents (AUTOMATION MODE => diff-only)
# ----------------------------
cat > "$ROOT/.github/agents/architect.agent.md" <<'EOF'
---
name: architect
description: Spec & Architektur (SDD). Erstellt/aktualisiert Spec/Plan/ADRs. Diff-only in Automation Mode.
---

You are the **Architect** agent.

## Core rules
- Specs are the source of truth. Code implements specs.
- If anything is ambiguous, **do not ask questions**; instead:
  - write explicit assumptions into the spec/plan
  - add an “Open Questions” section
- Prefer minimal, verifiable architecture.

## Output contract
If the user request contains the phrase **AUTOMATION MODE**, you MUST output **ONLY** a single unified diff patch between markers:

[BEGIN PATCH]
<unified diff>
[END PATCH]

No explanations, no markdown fences, no extra text.

Otherwise, provide a structured spec/plan/ADR proposal in plain text.

## Typical files
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/architecture/adr-*.md

## What you produce
- Clear problem framing, scope, invariants, acceptance criteria
- Architecture notes, boundaries, contract changes, risks
- Explicit test strategy linked to acceptance criteria
EOF

cat > "$ROOT/.github/agents/planner.agent.md" <<'EOF'
---
name: planner
description: Zerlegt Plan in Tasks (klein, reviewbar) inkl. AC, Tests, Dependencies. Diff-only in Automation Mode.
---

You are the **Planner** agent.

## Core rules
- Convert plan → tasks that are small and independently reviewable.
- Every acceptance criterion must map to tests.
- Use explicit Dependencies: T-001, T-002, ...

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

## Typical files
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md

## Task template requirements
Each task must include:
- Status (TODO/DOING/BLOCKED/DONE/FAILED)
- Goal
- Acceptance Criteria (testable)
- Required Tests
- Likely Areas/Files
- Dependencies
EOF

cat > "$ROOT/.github/agents/implementer.agent.md" <<'EOF'
---
name: implementer
description: Implementiert genau einen Task, klein & reviewbar. Diff-only in Automation Mode.
---

You are the **Implementer** agent.

## Core rules
- Implement ONLY what the selected task demands.
- Keep PR-size changes. Avoid refactors unless required by task.
- If you must deviate from spec/plan, STOP and produce a spec/plan patch first.

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

No extra text.

## Typical inputs
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (TASK <TASK_ID>)

## Deliverable
- Code changes (minimal)
- Updates to docs if required by task
- No task status changes unless explicitly requested (some orchestrators do it themselves)
EOF

cat > "$ROOT/.github/agents/tester.agent.md" <<'EOF'
---
name: tester
description: Ergänzt/erstellt Tests, behebt Gate-Failures. Diff-only in Automation Mode.
---

You are the **Tester** agent.

## Core rules
- Tests must prove acceptance criteria.
- Prefer deterministic, stable tests.
- When gates fail, fix the minimal set of issues.

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

No extra text.

## Typical inputs
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (TASK <TASK_ID>)
- Gate error logs (if provided)

## Deliverable
- Tests added/updated
- Minimal fixes to make gates pass
EOF

cat > "$ROOT/.github/agents/reviewer.agent.md" <<'EOF'
---
name: reviewer
description: Spec-driven Review, schreibt Findings in review.md. Diff-only in Automation Mode.
---

You are the **Reviewer** agent.

## Core rules
- Review against specs/constitution first, code second.
- Findings must be actionable.
- Classify severity: BLOCKER / MAJOR / MINOR.

## Output contract
If the user request contains **AUTOMATION MODE**, output **ONLY** a unified diff patch between markers:
[BEGIN PATCH]
<unified diff>
[END PATCH]

No extra text.

## Typical inputs
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md
- current git diff / PR changes
- specs/features/<FEATURE>/review.md

## Deliverable
- A review report in `specs/features/<FEATURE>/review.md`
- Clear pass/fail summary + findings + missing tests/docs
EOF

# ----------------------------
# 6) Orchestrator runner (production-grade)
# ----------------------------
cat > "$ROOT/scripts/auto_workflow.py" <<'EOF'
#!/usr/bin/env python3
import os, re, subprocess, sys
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
        cmd, cwd=str(ROOT),
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.PIPE if capture else None,
        text=True, check=check
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
        block = tasks_md[m.end(): m.end() + 1500]

        sm = re.search(r"-\s*Status:\s*(TODO|DOING|BLOCKED|DONE|FAILED)\b", block)
        status = sm.group(1) if sm else "TODO"

        dm = re.search(r"-\s*Dependencies:\s*(.*)$", block, re.M)
        deps: List[str] = []
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
        rf"(###\s+{re.escape(task_id)}\s+—[^\n]*\n(?:.*\n){{0,80}}?- Status:\s*)(TODO|DOING|BLOCKED|DONE|FAILED)",
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
    for t in tasks:
        if t.status == "TODO":
            return t
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
    if BEGIN in text and END in text:
        patch = text.split(BEGIN, 1)[1].split(END, 1)[0]
        return patch.strip("\n") + "\n"

    m = re.search(r"(^diff --git .*?$)", text, re.M)
    if m:
        return text[m.start():].strip("\n") + "\n"

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
        tasks = parse_tasks(read_text(tasks_path))

        next_task = choose_next_task(tasks)
        if not next_task:
            break

        if max_tasks is not None and count >= max_tasks:
            break

        t = next_task
        print(f"\n=== {t.task_id}: {t.title} (deps: {', '.join(t.deps) or 'none'}) ===")

        if branch_per_task:
            create_branch(feature, t.task_id)

        set_task_status(feature, t.task_id, "DOING")
        run(["git", "add", str(tasks_path)], check=True)
        run(["git", "commit", "-m", f"{feature}: set {t.task_id} DOING"], check=True)

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
                    raise SystemExit(f"{stage_name} failed after {retries} retries. See logs in {LOG_DIR}")

        attempt = 0
        while True:
            attempt += 1
            ok, gate_err = run_gates()
            if ok:
                break
            if attempt > retries:
                set_task_status(feature, t.task_id, "FAILED")
                raise SystemExit(f"Gates failed after {retries} retries.\n{gate_err}")

            log_path = LOG_DIR / f"{feature}_{t.task_id}_fixgates_attempt{attempt}.log"
            prompt = load_prompt("05_tester_task_auto.md", feature, t.task_id,
                                 extra_context=f\"Local gates failed. Fix code/tests and return patch.\\nERROR:\\n{gate_err}\")
            out = copilot(prompt, agent="tester", log_path=log_path)
            patch = extract_patch(out)
            ok2, err2 = apply_patch(patch)
            if not ok2:
                # next loop iteration will retry; keep apply error context
                pass

        set_task_status(feature, t.task_id, "DONE")
        run(["git", "add", "-A"], check=True)
        run(["git", "commit", "-m", f"{feature}: complete {t.task_id}"], check=True)

        count += 1

    if do_review:
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
EOF

chmod +x "$ROOT/scripts/auto_workflow.py"

# ----------------------------
# 7) Minimal repo instruction stub (optional)
# ----------------------------
cat > "$ROOT/.github/copilot-instructions.md" <<'EOF'
# Copilot Instructions (Repo-wide)

- Follow specs/constitution.md.
- Prefer small, reviewable diffs.
- In AUTOMATION MODE: output ONLY a unified diff patch between [BEGIN PATCH] and [END PATCH].
EOF

# ----------------------------
# 8) Done + next steps hint
# ----------------------------
echo
echo "✅ Bootstrapped local-only Copilot agent workflow scaffold."
echo
echo "Next:"
echo "1) Create a feature from template:"
echo "   mkdir -p specs/features/<feature> && cp specs/features/TEMPLATE/* specs/features/<feature>/"
echo "2) Fill spec/plan/tasks for that feature."
echo "3) Run orchestrator:"
echo "   ./scripts/auto_workflow.py <feature> --max 1 --retries 2 --branch-per-task --review"
echo
echo "Wire gates in scripts/gates/*.sh to your stack (Rust/Node/Flutter/etc.)."

```
