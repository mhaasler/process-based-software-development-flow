#!/usr/bin/env bash
set -euo pipefail

mkdir -p knowledge/inbox
ts="$(date +"%Y-%m-%d_%H-%M-%S")"
file="knowledge/inbox/${ts}.md"

title="${1:-Idee}"
shift || true
body="${*:-}"

cat > "$file" <<EOT
---
title: ${title}
created_at: $(date -Iseconds)
source:
tags: []
---

## Rohtext
${body}

## Notizen (optional)
- Kontext:
- Warum wichtig:
- Links/Quellen:
EOT

echo "Created: $file"
