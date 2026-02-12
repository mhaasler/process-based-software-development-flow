#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage:"
  echo "  $0 <ai_output.md> [out.diff]"
  echo ""
  echo "Examples:"
  echo "  $0 ai_output.md"
  echo "  $0 ai_output.md patch.diff"
  exit 1
fi

in_file="$1"
out_file="${2:-}"

if [ ! -f "$in_file" ]; then
  echo "Error: input file not found: $in_file"
  exit 1
fi

# default output name
if [ -z "$out_file" ]; then
  base="$(basename "$in_file")"
  out_file="${base%.*}.diff"
fi

python3 - <<'PY' "$in_file" "$out_file"
import re
import sys
from pathlib import Path

in_file = Path(sys.argv[1])
out_file = Path(sys.argv[2])

txt = in_file.read_text(encoding="utf-8")

# 1) Prefer fenced code blocks that look like diff
#    ```diff ... ```
m = re.search(r"```diff\s*\n([\s\S]*?)\n```", txt, re.IGNORECASE)
if m:
    diff = m.group(1)
else:
    # 2) Fallback: take everything starting at first 'diff --git'
    idx = txt.find("diff --git")
    if idx == -1:
        # 3) Fallback: look for '--- a/' + '+++ b/' style
        m2 = re.search(r"(?m)^(---\s+a/.*\n\+\+\+\s+b/.*\n)", txt)
        if not m2:
            raise SystemExit("No diff found. Expected ```diff``` block or 'diff --git' header.")
        idx = m2.start()
    diff = txt[idx:]

# Basic sanity: must contain at least one file header
if "diff --git" not in diff and not re.search(r"(?m)^---\s+a/", diff):
    raise SystemExit("Extracted content doesn't look like a unified diff.")

out_file.write_text(diff.rstrip() + "\n", encoding="utf-8")
print(f"Wrote: {out_file}")
PY
