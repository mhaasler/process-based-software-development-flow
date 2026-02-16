# Copilot Workflow Runbook (human-in-the-loop)


## Datei-Layout

```text
.github/
  agents/                      # optional (wenn du Custom Agents nutzt)
  copilot-instructions.md      # optional (Repo-Regeln)
scripts/
  workflow.sh                  # Orchestrator (single entrypoint)
  gates/
    format.sh
    lint.sh
    test.sh
  prompts/
    01_architect_spec.md
    02_architect_plan.md
    03_planner_tasks.md
    04_implementer_task.md
    05_tester_task.md
    06_reviewer.md
specs/
  constitution.md
  features/
    TEMPLATE/
      spec.md
      plan.md
      tasks.md
      review.md
```


## 1) scripts/workflow.sh (Orchestrator)

Der Orchestrator macht drei Dinge:
	1.	prüft, ob die nötigen Artefakte existieren
	2.	zeigt dir, welcher Prompt für welchen Agenten als Nächstes dran ist
	3.	führt lokale Gates aus

```bash
#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./scripts/workflow.sh init <feature>
#   ./scripts/workflow.sh next <feature>
#   ./scripts/workflow.sh task <feature> <task_id>
#   ./scripts/workflow.sh gates
#   ./scripts/workflow.sh review <feature>
#
# Example:
#   ./scripts/workflow.sh init user-login
#   ./scripts/workflow.sh next user-login
#   ./scripts/workflow.sh task user-login T-003
#   ./scripts/workflow.sh gates
#   ./scripts/workflow.sh review user-login

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FEATURES_DIR="$ROOT/specs/features"
PROMPTS_DIR="$ROOT/scripts/prompts"
GATES_DIR="$ROOT/scripts/gates"

require_feature() {
  local feature="$1"
  if [[ ! -d "$FEATURES_DIR/$feature" ]]; then
    echo "Feature not found: $FEATURES_DIR/$feature"
    echo "Run: ./scripts/workflow.sh init $feature"
    exit 1
  fi
}

print_prompt() {
  local prompt_file="$1"
  echo
  echo "==================== NEXT PROMPT ===================="
  echo "File: $prompt_file"
  echo "-----------------------------------------------------"
  cat "$prompt_file"
  echo "====================================================="
  echo
}

exists_nonempty() {
  local f="$1"
  [[ -f "$f" ]] && [[ -s "$f" ]]
}

cmd_init() {
  local feature="$1"
  mkdir -p "$FEATURES_DIR/$feature"

  for f in spec.md plan.md tasks.md review.md; do
    if [[ -f "$FEATURES_DIR/$feature/$f" ]]; then
      echo "Exists: specs/features/$feature/$f"
    else
      cp "$FEATURES_DIR/TEMPLATE/$f" "$FEATURES_DIR/$feature/$f"
      echo "Created: specs/features/$feature/$f"
    fi
  done

  echo
  echo "Initialized feature: $feature"
  echo "Next: ./scripts/workflow.sh next $feature"
}

cmd_next() {
  local feature="$1"
  require_feature "$feature"

  local spec="$FEATURES_DIR/$feature/spec.md"
  local plan="$FEATURES_DIR/$feature/plan.md"
  local tasks="$FEATURES_DIR/$feature/tasks.md"

  echo
  echo "Feature: $feature"
  echo "Artifacts:"
  echo "  - $spec"
  echo "  - $plan"
  echo "  - $tasks"
  echo

  if ! exists_nonempty "$spec" || grep -q "TODO_FILL" "$spec"; then
    echo "State: SPEC missing/incomplete → run Architect (Spec)"
    print_prompt "$PROMPTS_DIR/01_architect_spec.md"
    echo "Action:"
    echo "  Open: specs/features/$feature/spec.md"
    echo "  Use:  Architect agent with the prompt above"
    return
  fi

  if ! exists_nonempty "$plan" || grep -q "TODO_FILL" "$plan"; then
    echo "State: PLAN missing/incomplete → run Architect (Plan)"
    print_prompt "$PROMPTS_DIR/02_architect_plan.md"
    echo "Action:"
    echo "  Open: specs/features/$feature/plan.md"
    echo "  Use:  Architect agent with the prompt above"
    return
  fi

  if ! exists_nonempty "$tasks" || grep -q "TODO_FILL" "$tasks"; then
    echo "State: TASKS missing/incomplete → run Planner (Tasks)"
    print_prompt "$PROMPTS_DIR/03_planner_tasks.md"
    echo "Action:"
    echo "  Open: specs/features/$feature/tasks.md"
    echo "  Use:  Planner agent with the prompt above"
    return
  fi

  echo "State: IMPLEMENTATION LOOP"
  echo "Pick a TODO task from specs/features/$feature/tasks.md and run:"
  echo "  ./scripts/workflow.sh task $feature <TASK_ID>"
}

cmd_task() {
  local feature="$1"
  local task_id="$2"
  require_feature "$feature"

  echo
  echo "Feature: $feature | Task: $task_id"
  echo
  echo "1) Implementer prompt:"
  print_prompt "$PROMPTS_DIR/04_implementer_task.md"

  echo "2) Tester prompt:"
  print_prompt "$PROMPTS_DIR/05_tester_task.md"

  echo "3) Run gates:"
  echo "   ./scripts/workflow.sh gates"
}

cmd_gates() {
  echo
  echo "==================== RUNNING GATES ===================="
  local failed=0

  for gate in "$GATES_DIR"/format.sh "$GATES_DIR"/lint.sh "$GATES_DIR"/test.sh; do
    if [[ -x "$gate" ]]; then
      echo
      echo ">> $gate"
      if ! "$gate"; then
        echo "Gate failed: $gate"
        failed=1
      fi
    else
      echo
      echo ">> Skipping (not executable): $gate"
    fi
  done

  echo
  if [[ "$failed" -eq 1 ]]; then
    echo "GATES: ❌ FAILED"
    exit 1
  else
    echo "GATES: ✅ PASSED"
  fi
}

cmd_review() {
  local feature="$1"
  require_feature "$feature"

  echo
  echo "State: REVIEW"
  print_prompt "$PROMPTS_DIR/06_reviewer.md"
  echo "Action:"
  echo "  - Ensure all tasks DONE + gates green"
  echo "  - Fill: specs/features/$feature/review.md"
  echo "  - Then create PR and request Copilot review (optional)"
}

main() {
  local cmd="${1:-}"
  case "$cmd" in
    init)   cmd_init "${2:?feature required}" ;;
    next)   cmd_next "${2:?feature required}" ;;
    task)   cmd_task "${2:?feature required}" "${3:?task_id required}" ;;
    gates)  cmd_gates ;;
    review) cmd_review "${2:?feature required}" ;;
    *)
      echo "Unknown command: $cmd"
      echo "Usage:"
      echo "  ./scripts/workflow.sh init <feature>"
      echo "  ./scripts/workflow.sh next <feature>"
      echo "  ./scripts/workflow.sh task <feature> <task_id>"
      echo "  ./scripts/workflow.sh gates"
      echo "  ./scripts/workflow.sh review <feature>"
      exit 1
      ;;
  esac
}

main "$@"
```

Danach:
```bash
chmod +x scripts/workflow.sh
```


## 2) Gates (Platzhalter) – scripts/gates/*.sh

Du passt sie später je nach Stack an. Wichtig: lokal reproduzierbar.

scripts/gates/format.sh

```bash
#!/usr/bin/env bash
set -euo pipefail
echo "FORMAT gate placeholder (wire to your formatter)"
# examples:
# cargo fmt --check
# npm run format:check
# dart format --output=none --set-exit-if-changed .
```

scripts/gates/lint.sh

```bash
#!/usr/bin/env bash
set -euo pipefail
echo "LINT gate placeholder (wire to your linter)"
# examples:
# cargo clippy --all-targets --all-features -- -D warnings
# npm run lint
# dart analyze
```

scripts/gates/test.sh

```bash
#!/usr/bin/env bash
set -euo pipefail
echo "TEST gate placeholder (wire to your test runner)"
# examples:
# cargo test
# npm test
# flutter test
```

Danach:
```bash
chmod +x scripts/gates/*.sh
```


## 3) Prompt-Templates – scripts/prompts/*.md

Diese Templates sind generisch und referenzieren immer Repo-Artefakte, nicht Chat-Kontext.

01_architect_spec.md

```markdown
ROLE: Architect

GOAL:
Create/complete the feature specification.

INPUT FILES:
- specs/constitution.md
- specs/features/<FEATURE>/spec.md (edit this)

OUTPUT REQUIREMENTS (write into spec.md):
- Problem statement (why)
- Scope / non-goals
- Key invariants (must always hold)
- User-visible behavior (externally observable)
- Interfaces / boundaries (what talks to what, at a high level)
- Risks / open questions (explicit)
- Acceptance criteria (testable)

CONSTRAINTS:
- Keep it implementation-agnostic.
- No code. No pseudo-impl. Specs only.
- If you need assumptions, list them explicitly.

NOW:
Update specs/features/<FEATURE>/spec.md accordingly.
```

02_architect_plan.md

```markdown
ROLE: Architect

GOAL:
Derive an implementation plan from the spec.

INPUT FILES:
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md (edit this)

OUTPUT REQUIREMENTS (write into plan.md):
- Architecture notes (components/modules affected)
- Interface changes (new/changed contracts)
- Data model changes (if any)
- Step-by-step strategy (ordered)
- Observability / logging / error handling expectations
- Test strategy (unit/integration/smoke) mapped to acceptance criteria
- Migration / rollout notes (if relevant)
- Risks and mitigations

CONSTRAINTS:
- Plan must be actionable but still tech-stack neutral.
- No huge leaps: every step should be verifiable.

NOW:
Update specs/features/<FEATURE>/plan.md accordingly.
```

03_planner_tasks.md

```markdown
ROLE: Planner

GOAL:
Convert plan into a task breakdown that can be implemented in small PRs.

INPUT FILES:
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (edit this)

OUTPUT REQUIREMENTS (write into tasks.md):
For each task:
- Task ID (T-001, T-002, ...)
- Title
- Status (TODO/DOING/BLOCKED/DONE)
- Goal
- Acceptance criteria (bullet list, testable)
- Required tests (what must be added/updated)
- Files/areas likely touched (approx)
- Dependencies (task IDs)

RULES:
- Prefer tasks that can be completed in <1 day.
- Each task must be independently reviewable.
- Every acceptance criterion must map to at least one test.

NOW:
Update specs/features/<FEATURE>/tasks.md accordingly.
```

04_implementer_task.md

```markdown
ROLE: Implementer

GOAL:
Implement a single task end-to-end, minimally.

INPUT FILES:
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (read the selected TASK)

REQUIREMENTS:
- Implement only what the selected TASK demands.
- Keep changes small and reviewable.
- If you must deviate from spec/plan, STOP and propose a spec change first.
- Update task status in tasks.md when done.

DELIVERABLE:
- Code changes + docs changes needed for the task
- Local gates must pass (format/lint/test)

NOW:
Implement TASK <TASK_ID> for feature <FEATURE>.
```

05_tester_task.md

```markdown
ROLE: Tester

GOAL:
Add/extend tests for the selected task and validate acceptance criteria.

INPUT FILES:
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md (selected TASK)

REQUIREMENTS:
- Create/extend tests that directly prove the task’s acceptance criteria.
- Include regression tests where appropriate.
- Ensure tests are stable and deterministic.
- If acceptance criteria are ambiguous, propose improvements to spec/tasks.

DELIVERABLE:
- Tests added/updated
- Notes if spec/task needs tightening

NOW:
Add/extend tests for TASK <TASK_ID> in feature <FEATURE>.
```

06_reviewer.md

```markdown
ROLE: Reviewer

GOAL:
Perform a spec-driven review of the implementation.

INPUT FILES:
- specs/constitution.md
- specs/features/<FEATURE>/spec.md
- specs/features/<FEATURE>/plan.md
- specs/features/<FEATURE>/tasks.md
- git diff / PR changeset
- specs/features/<FEATURE>/review.md (edit this)

REVIEW CHECKLIST:
- Spec compliance: does code implement spec (no extra behavior)?
- Architecture: boundaries/contracts respected?
- Tests: acceptance criteria covered?
- Observability: errors/logging/metrics aligned with constitution/plan?
- Security & correctness: obvious risks?
- Maintainability: complexity hotspots called out?

OUTPUT FORMAT (write into review.md):
- Summary (pass/fail + why)
- Findings (severity: BLOCKER/MAJOR/MINOR)
- Missing tests / missing docs
- Suggested follow-ups (if any)

NOW:
Update specs/features/<FEATURE>/review.md accordingly.
```


⸻

## 4) Feature Templates – specs/features/TEMPLATE/*

specs/features/TEMPLATE/spec.md

```markdown
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
```

specs/features/TEMPLATE/plan.md

```markdown
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
```

specs/features/TEMPLATE/tasks.md

```markdown
# Feature Tasks: TODO_FILL

## Task List

### T-001 — TODO_FILL
- Status: TODO
- Goal: TODO_FILL
- Acceptance Criteria:
  - TODO_FILL
- Required Tests:
  - TODO_FILL
- Likely Areas/Files:
  - TODO_FILL
- Dependencies:
  - None

<!-- Copy/paste blocks for more tasks -->
```

specs/features/TEMPLATE/review.md

```markdown
# Feature Review: TODO_FILL

## Summary
TODO_FILL

## Findings
- [SEVERITY] TODO_FILL

## Missing Tests / Docs
- TODO_FILL

## Follow-ups
- TODO_FILL
```


## 5) So benutzt du es (wirklich praktisch)

```bash
# 1) Feature initialisieren
./scripts/workflow.sh init user-login

# 2) Was ist der nächste Schritt?
./scripts/workflow.sh next user-login
# -> zeigt dir den Architect Spec Prompt

# 3) Wenn Spec & Plan & Tasks stehen:
./scripts/workflow.sh task user-login T-001
# -> zeigt Implementer+Tester Prompts

# 4) Qualität prüfen
./scripts/workflow.sh gates

# 5) Wenn alles done:
./scripts/workflow.sh review user-login
```


## 6) Wie du damit “echte Agent-Orchestrierung” machst (ohne Extra-Tools)

	•	In VS Code: du wählst den jeweiligen Custom Agent (Architect/Planner/…) und kopierst den Prompt aus scripts/prompts/* (oder referenzierst ihn: “Nutze scripts/prompts/01_architect_spec.md und setze =user-login”).
	•	Das Entscheidende ist: Jeder Agent schreibt in die Artefakte (spec.md, plan.md, tasks.md, review.md) — das ist dein Orchestrierungsbus.


    
