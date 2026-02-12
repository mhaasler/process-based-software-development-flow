---
id: decision_process
title: Entscheidungsprozess
kind: concept
layer: 3
summary: >
  Definiert, wie Entscheidungen entstehen: Kriterien, Beteiligung, Timebox, „Definition of Decided“.
core_decision: >
  Wie werden Entscheidungen getroffen, sodass sie schnell, nachvollziehbar und korrigierbar sind?
tags: [governance, process]
links:
  - { rel: uses, to: decision_records, strength: 0.6 }
  - { rel: is_constrained_by, to: policy_system, strength: 0.5 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.6, max: 0.9 }
  automatable: { min: 0.2, max: 0.5 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Entscheidungskriterien vorab (SLO, Risk, Cost, Compatibility).
- Timebox + “owner decides” wenn nötig – sonst endlose Debatten.
- Entscheidungen werden in Artefakte überführt (ADR/Spec/Policy).

**Typische Failure-Modes**
- Meetings ohne Entscheidungsdefinition → viel Reden, wenig Ergebnis.
- Keine Kriterien → Entscheidung ist politisch.
- Entscheidungen nicht dokumentiert → Wiederholungsschleifen.
