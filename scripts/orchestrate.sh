#!/usr/bin/env bash
set -euo pipefail

# Orchestrator for Copilot CLI
# Routes tasks to specific agents and runs the appropriate gates.
#
# Usage:
#   scripts/orchestrate.sh <type> "<prompt>" [context_paths...]
#
# Types:
#   knowledge | spec | arch | impl | security | observability | review | governance
#
# Examples:
#   scripts/orchestrate.sh knowledge "Curate inbox entry ..." knowledge/inbox/2026-02-13.md
#   scripts/orchestrate.sh spec "Create governance policy ..." specs/constitution.md specs/ai_policy.md
#   scripts/orchestrate.sh impl "Implement feature X ..." specs/feature_x.md

TYPE="${1:-}"
PROMPT="${2:-}"
shift 2 || true
CONTEXT_PATHS=("$@")

if [[ -z "$TYPE" || -z "$PROMPT" ]]; then
  echo "Usage: scripts/orchestrate.sh <type> \"<prompt>\" [context_paths...]"
  exit 1
fi

case "$TYPE" in
  knowledge)       AGENT="curator-agent" ;;
  spec)            AGENT="spec-agent" ;;
  arch)            AGENT="architecture-agent" ;;
  impl)            AGENT="implementation-agent" ;;
  security)        AGENT="security-agent" ;;
  observability)   AGENT="observability-agent" ;;
  review)          AGENT="review-agent" ;;
  governance)      AGENT="governance-agent" ;;
  *)
    echo "Unknown type: $TYPE"
    exit 1
    ;;
esac

# Build a context bundle (optional, but makes prompts reproducible)
CTX_FILE="$(mktemp)"
trap 'rm -f "$CTX_FILE"' EXIT

{
  echo "### TASK TYPE"
  echo "$TYPE"
  echo
  echo "### TASK PROMPT"
  echo "$PROMPT"
  echo
  echo "### HARD RULES"
  echo "- Follow: specs/constitution.md, specs/ai_policy.md, specs/agent_roles_spec.md, .github/copilot-instructions.md"
  echo "- Output must be diff-ready (file edits/patches)."
  echo "- Do NOT output secrets or request credentials."
  echo "- Keep knowledge nodes short: guardrails + failure-modes."
  echo "- Do not rename ids without explicit migration plan."
  echo
  if [[ ${#CONTEXT_PATHS[@]} -gt 0 ]]; then
    echo "### CONTEXT FILES"
    for p in "${CONTEXT_PATHS[@]}"; do
      echo "- $p"
    done
    echo
    echo "### CONTEXT CONTENT (snippets)"
    for p in "${CONTEXT_PATHS[@]}"; do
      if [[ -f "$p" ]]; then
        echo
        echo "---- FILE: $p ----"
        # keep snippets short to avoid overloading
        head -n 80 "$p"
      else
        echo
        echo "---- FILE: $p (missing) ----"
      fi
    done
  fi
} > "$CTX_FILE"

echo "==> Using agent: $AGENT"
echo "==> Context bundle: $CTX_FILE"
echo

# Load prompt template if it exists; otherwise run with a generic instruction.
TEMPLATE="scripts/prompts/${TYPE}.txt"
FINAL_PROMPT=""

if [[ -f "$TEMPLATE" ]]; then
  FINAL_PROMPT="$(cat "$TEMPLATE")"$'\n\n'"---"$'\n'"TASK:"$'\n'"$PROMPT"$'\n\n'"CONTEXT BUNDLE (read-only):"$'\n'"$(cat "$CTX_FILE")"
else
  FINAL_PROMPT="You are the ${AGENT}. Follow repo instructions. Produce diff-ready changes only."$'\n\n'"TASK:"$'\n'"$PROMPT"$'\n\n'"CONTEXT:"$'\n'"$(cat "$CTX_FILE")"
fi

# Invoke Copilot CLI (non-interactive).
# NOTE: Copilot may still request trust/approval depending on settings (this is desired for safety).
copilot --agent="$AGENT" --prompt "$FINAL_PROMPT"

# Gates by type
case "$TYPE" in
  knowledge|observability|security)
    scripts/run_gates.sh knowledge
    ;;
  spec|arch)
    # spec/arch may touch knowledge or not; run knowledge gates if knowledge changed
    if git diff --name-only | grep -qE '^knowledge/'; then
      scripts/run_gates.sh knowledge
    fi
    ;;
  impl)
    # if implementation changed knowledge too, run both
    if git diff --name-only | grep -qE '^knowledge/'; then
      scripts/run_gates.sh all
    else
      scripts/run_gates.sh code
    fi
    ;;
  review|governance)
    # no gates required; these roles should primarily produce findings/patch suggestions
    ;;
esac

echo "OK: orchestrate ($TYPE) via $AGENT"
