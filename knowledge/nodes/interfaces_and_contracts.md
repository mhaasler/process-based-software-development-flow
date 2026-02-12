---
id: interfaces_and_contracts
title: Interfaces & Contracts
kind: concept
layer: 3
summary: >
  Macht Schnittstellen, Datenformen und Invarianten explizit – damit Teams/Tools unabhängig arbeiten können.
core_decision: >
  Welche Contracts sind stabil genug, um Autonomie zu ermöglichen, ohne Innovation zu blockieren?
tags: [architecture, structure]
links:
  - { rel: is_constrained_by, to: architecture_boundaries, strength: 0.8 }
  - { rel: enables, to: module_composition, strength: 0.7 }
  - { rel: is_validated_by, to: quality_gates, strength: 0.7 }
  - { rel: is_expressed_in, to: specification, strength: 0.6 }
  - { rel: is_constrained_by, to: requirements, strength: 0.6 }
gradients:
  explicitness: { min: 0.7, max: 1.0 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.5, max: 0.8 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- Contracts sind *klein und hart*: Inputs/Outputs, Errors, Invarianten.
- Prefer “schema + examples + tests” statt lange Prosa.
- Versionierung/Kompatibilität explizit (breaking vs non-breaking).

**Typische Failure-Modes**
- Contracts sind “implizit im Code” → KI/Reviews raten.
- Zu breite Interfaces → alles hängt an allem.
- Keine Kompatibilitätsstrategie → Change wird teuer.
