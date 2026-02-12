---
id: execution
title: Ausführung
kind: concept
layer: 3
summary: >
  Implementierung + Automatisierung: Code/Infra/Config werden erzeugt, geprüft, integriert und reproduzierbar gebaut.
core_decision: >
  Welche Teile sind deterministisch ausführbar, welche benötigen menschliche Entscheidungen – und wo sind die Gates?
tags: [process, seed]
links:
  - { rel: is_scheduled_by, to: planning_and_work, strength: 0.8 }
  - { rel: produces_for, to: review_and_quality, strength: 0.9 }
  - { rel: realizes, to: specification, strength: 0.7 }
  - { rel: runs_under, to: runtime_execution_authority, strength: 0.6 }
gradients:
  explicitness: { min: 0.4, max: 0.7 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.7, max: 0.9 }
---
**Leitplanken**
- „Done“ heißt: buildbar, testbar, beobachtbar – nicht „läuft auf meinem Rechner“.
- Automatisiere wiederholbare Entscheidungen (Format, Lint, Schema, Contracts, Smoke).
- Halte Execution deterministisch: gleiche Inputs → gleiche Outputs (so weit möglich).

**Typische Failure-Modes**
- Implizite Entscheidungen im Code/Config → später nicht mehr rekonstruierbar.
- Lokale Sonderpfade/Manual-Fixes → CI/Review verlieren Autorität.
- Fehlende Observability-Hooks → Feedback-Schleife bricht.
