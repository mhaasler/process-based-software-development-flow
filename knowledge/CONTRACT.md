# Knowledge Contract (PSE)

## Entities
### Node (knowledge/nodes/*.md)
Frontmatter Pflicht:
- id (string, unique)
- title (string)
- kind (core|concept|tool|pattern|metric|warning)
- layer (number)
- summary (1–2 Sätze)
- core_decision (1 Satz, Frage- oder Entscheidungsform)
- tags (array)
- links (array of {rel,to,strength})
- gradients (map: gradient_id -> {min,max})

Body:
- Leitplanken (3 bullets)
- Failure-Modes (3 bullets)
- Optional: Artefakte / Checks

### Galaxy (knowledge/galaxies/*.yml)
- id
- title
- drill_from (node id) optional
- root (node id) optional
- hide_root (bool) optional
- stars (node ids)
- gradients (gradient ids)
- description optional (1–3 Sätze)

### Gradient (knowledge/gradients/*.yml)
- id
- title
- left/right labels optional
- description optional

## Graph Rules
- Node ids sind global eindeutig.
- Links: `to` muss existieren (Build darf sonst failen).
- In einer Galaxy darf `drill_from` nicht in `stars` sein.
- Root ist Kontext (empfohlen: hide_root: true in Sub-Galaxies).

## Change Rules
- Änderungen am System erfolgen über diese Dateien, nicht über Code.
- Jede neue Idee zuerst als Node (oder Inbox) – danach Relationen.
