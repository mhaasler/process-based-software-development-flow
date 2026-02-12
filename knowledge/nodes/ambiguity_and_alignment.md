---
id: ambiguity_and_alignment
title: Ambiguität & Alignment
kind: concept
layer: 3
summary: >
  Behandelt Unsicherheit explizit: was ist unklar, wie wird entschieden, wann ist „genug Klarheit“ erreicht.
core_decision: >
  Wie wird Ambiguität sichtbar gemacht und aufgelöst, ohne das System mit Overhead zu ersticken?
tags: [communication, process]
links:
  - { rel: is_reduced_by, to: shared_language_and_models, strength: 0.6 }
  - { rel: triggers, to: decision_records, strength: 0.5 }
  - { rel: shapes, to: planning_and_work, strength: 0.5 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.6, max: 0.9 }
  automatable: { min: 0.2, max: 0.5 }
  stability: { min: 0.3, max: 0.6 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Markiere Unsicherheit (Assumptions, Open Questions) als First-Class-Element.
- Alignment entsteht durch kleine, überprüfbare Entscheidungen (Specs/Proofs).
- Stop-Regeln: wann gilt etwas als entschieden (Gate/ADR/Spec-Merge).

**Typische Failure-Modes**
- Unklarheit wird ignoriert → später teure Rework-Schleifen.
- Perfektionismus → nie „ready“, keine Execution.
- Alignment nur sozial → keine artefaktische Absicherung.
