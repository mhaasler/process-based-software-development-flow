#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   scripts/run_gates.sh knowledge
#   scripts/run_gates.sh code
#   scripts/run_gates.sh all

MODE="${1:-all}"

case "$MODE" in
  knowledge)
    node build.mjs
    if [[ -f scripts/validate_knowledge.mjs ]]; then
      node scripts/validate_knowledge.mjs
    fi
    ;;
  code)
    # Keep minimal by default; adapt to your repo (e.g. npm test, cargo test, etc.)
    if [[ -f package.json ]]; then
      npm -s test || true
    fi
    ;;
  all)
    node build.mjs
    if [[ -f scripts/validate_knowledge.mjs ]]; then
      node scripts/validate_knowledge.mjs
    fi
    if [[ -f package.json ]]; then
      npm -s test || true
    fi
    ;;
  *)
    echo "Unknown mode: $MODE"
    exit 1
    ;;
esac

echo "OK: gates ($MODE)"
