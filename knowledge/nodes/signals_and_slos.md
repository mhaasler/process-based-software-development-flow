---
id: signals_and_slos
title: Signale & SLOs
kind: concept
layer: 3
summary: >
  Definiert, welche Signale den Systemzustand beweisen (SLOs/SLIs) und wie „gesund/kaputt“ entschieden wird.
core_decision: >
  Welche SLOs/Signale sind zwingend, um Verhalten zu beurteilen und Prioritäten zu steuern?
tags: [observability, operations]
links:
  - { rel: informs, to: feedback_and_learning, strength: 0.6 }
  - { rel: feeds, to: quality_gates, strength: 0.5 }
  - { rel: drives, to: quality_gates, strength: 0.4 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.5, max: 0.8 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Wenige, harte Signale > viele Metriken (SLOs als Entscheidungsgrundlage).
- SLOs müssen *operationalisierbar* sein (Messung + Schwelle + Konsequenz).
- “Error budget” oder ähnliches: Qualität wird planbar steuerbar.

**Typische Failure-Modes**
- Keine SLOs → Priorisierung wird politisch.
- Metriken ohne Entscheidung → Dashboard-Friedhof.
- Schwellen willkürlich → Alerts werden ignoriert.
