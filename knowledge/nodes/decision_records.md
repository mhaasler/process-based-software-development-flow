---
id: decision_records
title: Entscheidungsprotokolle (ADRs)
kind: concept
layer: 3
summary: >
  Macht Architektur-/Prozess-Entscheidungen nachvollziehbar: Kontext, Optionen, Begründung, Konsequenzen.
core_decision: >
  Welche Entscheidungen müssen als ADR festgehalten werden – und wann ist es Overhead?
tags: [communication, governance, architecture]
links:
  - { rel: supports, to: change_control, strength: 0.6 }
  - { rel: references, to: architecture_boundaries, strength: 0.5 }
  - { rel: references, to: interfaces_and_contracts, strength: 0.5 }
  - { rel: feeds, to: change_control, strength: 0.6 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.2, max: 0.5 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- ADRs für irreversible oder teure Entscheidungen (Boundaries, Contracts, Runtimes, Policies).
- Kurz halten: Kontext → Entscheidung → Konsequenzen → Revisionspfad.
- ADRs sind Link-Knoten: sie verweisen auf Specs/Policies/Code.

**Typische Failure-Modes**
- Keine ADRs → Wiederholte Debatten, keine Lernkurve.
- ADRs als Roman → niemand liest, niemand pflegt.
- ADRs ohne Konsequenzen → „Papierentscheidungen“.
