---
id: quality_gates
title: Quality Gates & Policies
kind: concept
layer: 3
summary: >
  Formale Checks (Lint, Tests, Contract/Schema-Gates), die Architektur- und Prozessregeln automatisch durchsetzen.
core_decision: >
  Welche Gates sind nicht verhandelbar – und welche werden als Empfehlungen geführt?
tags: [architecture, process, quality]
links:
  - { rel: enforces, to: architecture_boundaries, strength: 0.7 }
  - { rel: enforces, to: interfaces_and_contracts, strength: 0.7 }
  - { rel: enforces, to: module_composition, strength: 0.7 }
  - { rel: supports, to: change_control, strength: 0.6 }
  - { rel: reinforces, to: review_and_quality, strength: 0.7 }
  - { rel: reduces, to: meeting_load_and_latency, strength: 0.4 }
  - { rel: uses, to: signals_and_slos, strength: 0.4 }
  - { rel: enforces, to: supply_chain_security, strength: 0.5 }
  - { rel: is_implemented_by, to: automation_and_scripts, strength: 0.5 }
  - { rel: enforces, to: policy_system, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.2, max: 0.5 }
  automatable: { min: 0.8, max: 1.0 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- Gates codieren Regeln: “kein Review-Gefühl, sondern messbar”.
- Reihenfolge: billig → teuer (Format/Lint → Unit → Contract → Smoke).
- Fail-Fast mit klaren Meldungen und Fix-Hinweisen.

**Typische Failure-Modes**
- Gates sind optional → Regression wird Normalzustand.
- Gates ohne Developer-UX → werden umgangen.
- Zu viele Gates ohne Priorisierung → alles wird langsam und ignoriert.
