#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <patch.diff> [--commit \"message\"]"
  exit 1
fi

patch_file="$1"
shift || true

commit_msg=""
if [ "${1:-}" = "--commit" ]; then
  commit_msg="${2:-}"
  if [ -z "$commit_msg" ]; then
    echo "Error: --commit requires a message"
    exit 1
  fi
fi

# Sanity checks
if [ ! -f "$patch_file" ]; then
  echo "Error: patch file not found: $patch_file"
  exit 1
fi

# Apply patch
echo "==> Applying patch: $patch_file"
git apply --whitespace=nowarn "$patch_file"

# Run gate
echo "==> Running knowledge gate"
./scripts/knowledge_gate.sh

# Show status
echo "==> Git status"
git status --short

# Optional commit
if [ -n "$commit_msg" ]; then
  echo "==> Committing"
  git add -A
  git commit -m "$commit_msg"
fi

echo "OK: patch applied and gate passed."
