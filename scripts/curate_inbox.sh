#!/usr/bin/env bash
set -euo pipefail

INBOX_DIR="knowledge/inbox"
DONE_DIR="knowledge/inbox/_done"
BUNDLE_DIR="knowledge/inbox/_bundle"

mkdir -p "$DONE_DIR" "$BUNDLE_DIR"

ts="$(date +"%Y-%m-%d_%H-%M-%S")"
run_dir="${BUNDLE_DIR}/${ts}"
mkdir -p "$run_dir"

# collect inbox files (exclude _done/_bundle)
files=()
while IFS= read -r file; do
  files+=("$file")
done < <(find "$INBOX_DIR" -maxdepth 1 -type f -name "*.md" | sort)

if [ "${#files[@]}" -eq 0 ]; then
  echo "No inbox items found in ${INBOX_DIR}"
  exit 0
fi

# copy governance context
cp -f knowledge/governance/constitution.md "$run_dir/constitution.md" 2>/dev/null || true
cp -f knowledge/governance/curator_policy.md "$run_dir/curator_policy.md" 2>/dev/null || true

# nodes index (ids + titles)
python3 - <<'PY' > "$run_dir/nodes_index.txt"
from pathlib import Path
import re

nodes = []
for p in Path("knowledge/nodes").glob("*.md"):
    txt = p.read_text(encoding="utf-8")
    m_id = re.search(r"(?m)^id:\s*([a-z0-9_]+)\s*$", txt)
    m_title = re.search(r"(?m)^title:\s*(.+)\s*$", txt)
    if m_id and m_title:
        nodes.append((m_id.group(1).strip(), m_title.group(1).strip(), p.name))
nodes.sort()
for nid, title, fname in nodes:
    print(f"{nid}\t{title}\t{fname}")
PY

# copy inbox items
mkdir -p "$run_dir/inbox"
for f in "${files[@]}"; do
  cp -f "$f" "$run_dir/inbox/"
done

# create prompt
cat > "$run_dir/PROMPT.md" <<'EOT'
# Curator Run – Inbox → Knowledge Graph (Diff only)

Du bist der Curator. Aufgabe: Kuratiere die Inbox in den Knowledge Graph.

## Regeln (MUST)
- Halte dich an `constitution.md` und `curator_policy.md`.
- Erzeuge **nur** einen Patch/Diff (unified diff), keine “Beschreibung ohne Patch”.
- Minimaler Text pro Node: Summary + 3 Leitplanken + 3 Failure-Modes.
- Pro neuem Node max 2–4 Links, load-bearing.
- Jeder neue Node muss in mindestens eine Galaxy aufgenommen werden.
- Keine kaputten Refs: IDs müssen existieren oder im Patch erstellt werden.

## Kontext
- Inbox: `inbox/`
- Nodes Index: `nodes_index.txt`
- Policies: `constitution.md`, `curator_policy.md`

## Output Format
1) Kurze Liste: „Was wird angelegt/angepasst“ (max 10 Zeilen)
2) Unified Diff (git apply kompatibel)

EOT

echo "Bundle created: $run_dir"
echo "Next: open $run_dir/PROMPT.md and feed to your AI (Copilot/ChatGPT)."
