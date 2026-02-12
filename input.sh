cat <<'EOF' > scripts/curate_apply.sh
#!/usr/bin/env bash
set -euo pipefail

INBOX_DIR="knowledge/inbox"
DONE_DIR="knowledge/inbox/_done"
BUNDLE_DIR="knowledge/inbox/_bundle"

usage() {
  echo "Usage:"
  echo "  $0 --new"
  echo "  $0 --apply <bundle_dir> [--move-done]"
  echo ""
  echo "Flow:"
  echo "  1) $0 --new"
  echo "     -> paste AI response into <bundle_dir>/AI_OUTPUT.md"
  echo "  2) $0 --apply <bundle_dir> --move-done"
  exit 1
}

if [ $# -lt 1 ]; then usage; fi

cmd="$1"
shift || true

mkdir -p "$DONE_DIR" "$BUNDLE_DIR"

if [ "$cmd" = "--new" ]; then
  # create bundle
  ./scripts/curate_inbox.sh

  # get latest bundle dir
  latest="$(ls -1 "$BUNDLE_DIR" | sort | tail -n 1)"
  if [ -z "$latest" ]; then
    echo "No bundle created."
    exit 1
  fi
  run_dir="${BUNDLE_DIR}/${latest}"

  # create AI_OUTPUT.md placeholder
  cat > "${run_dir}/AI_OUTPUT.md" <<'EOT'
# Paste AI output here

Expected:
- short summary (optional)
- unified diff, preferably in ```diff fenced block, or starting with "diff --git"
EOT

  echo ""
  echo "Bundle: ${run_dir}"
  echo "Next:"
  echo "  1) Open and paste AI output into:"
  echo "     ${run_dir}/AI_OUTPUT.md"
  echo "  2) Then run:"
  echo "     ./scripts/curate_apply.sh --apply ${run_dir} --move-done"
  exit 0
fi

if [ "$cmd" = "--apply" ]; then
  if [ $# -lt 1 ]; then usage; fi
  run_dir="$1"
  shift || true

  move_done=false
  if [ "${1:-}" = "--move-done" ]; then
    move_done=true
  fi

  if [ ! -d "$run_dir" ]; then
    echo "Error: bundle_dir not found: $run_dir"
    exit 1
  fi

  ai_file="${run_dir}/AI_OUTPUT.md"
  if [ ! -f "$ai_file" ]; then
    echo "Error: AI_OUTPUT.md not found in bundle_dir: $ai_file"
    exit 1
  fi

  patch_file="${run_dir}/patch.diff"

  echo "==> Extracting diff from: $ai_file"
  ./scripts/extract_patch.sh "$ai_file" "$patch_file"

  echo "==> Applying + gate: $patch_file"
  ./scripts/apply_and_gate.sh "$patch_file"

  if $move_done; then
    echo "==> Moving processed inbox items to _done"
    mkdir -p "$DONE_DIR"
    if [ -d "${run_dir}/inbox" ]; then
      for f in "${run_dir}/inbox/"*.md; do
        [ -e "$f" ] || continue
        base="$(basename "$f")"
        # only move if the original still exists (not already moved)
        if [ -f "${INBOX_DIR}/${base}" ]; then
          mv "${INBOX_DIR}/${base}" "${DONE_DIR}/${base}"
          echo "Moved: ${base}"
        fi
      done
    fi
  fi

  echo "OK: curated patch applied."
  exit 0
fi

usage
EOF

chmod +x scripts/curate_apply.sh