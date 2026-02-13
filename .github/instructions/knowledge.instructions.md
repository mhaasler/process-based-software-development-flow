# Knowledge System Instructions (applies to knowledge/**)
# This file constrains how Copilot edits the knowledge graph.

## Allowed files
- knowledge/nodes/*.md
- knowledge/galaxies/*.yml
- knowledge/inbox/*.md (raw dumps only; never treated as truth)

## Node rules (knowledge/nodes/*.md)
- Each node must have frontmatter with:
  - id, title, kind, layer, summary, core_decision, tags, links, gradients
- Body must be short:
  - "Leitplanken" (bullets)
  - "Typische Failure-Modes" (bullets)
- Prefer precise language, no preachy tone, no "must/should" overuse.
- Keep links minimal (2–6). Only structural, load-bearing relationships.

## Galaxy rules (knowledge/galaxies/*.yml)
- Use drill_from + hide_root for sub-galaxies.
- Keep star lists curated (not exhaustive).
- Gradients list should match the conceptual axes used in nodes.

## Forbidden
- No long wiki-style explanations.
- No duplicating the same content across multiple nodes.
- No "giant node" that becomes a dumping ground.
- No silent id changes (require explicit migration plan).

## Gates after changes
- Always run: node build.mjs
- If present: node scripts/validate_knowledge.mjs
- If validation fails: fix artifacts, do not handwave.
