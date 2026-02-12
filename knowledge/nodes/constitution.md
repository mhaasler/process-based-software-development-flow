---
id: constitution
title: Constitution (Governance Minimum)
kind: core
layer: 2
summary: >
  Oberste Regelquelle: Truth Sources, nicht verhandelbare Regeln, Change Process und verpflichtende Gates.
core_decision: >
  Welche Regeln definieren Autorität und Verbindlichkeit – und wie wird ihre Einhaltung technisch erzwungen?
tags: [governance, policy]
links:
  - { rel: is_part_of, to: governance, strength: 0.7 }
  - { rel: enforces, to: policy_system, strength: 0.6 }
  - { rel: is_enforced_by, to: quality_gates, strength: 0.5 }
gradients:
  explicitness: { min: 0.8, max: 1.0 }
  stability: { min: 0.8, max: 1.0 }
  centrality: { min: 0.8, max: 1.0 }
---
**Leitplanken**
- Eine Wahrheit pro Thema (Truth Sources).
- Änderungen sind Diffs + Gate + Review.
- KI liefert Vorschläge, Wahrheit entsteht durch Merge.

**Typische Failure-Modes**
- Regeln werden “Interpretation” statt Code/Files.
- Gates werden optional.
- Knowledge driftet schneller als sie gepflegt wird.
