---
id: dashboards_and_queries
title: Dashboards & Queries
kind: concept
layer: 3
summary: >
  Definiert, wie Informationen auffindbar sind: Dashboards, Standard-Queries, Drilldowns und Debug-Playbooks.
core_decision: >
  Welche Sichten/Queries müssen standardisiert sein, damit Diagnose reproduzierbar ist?
tags: [observability]
links:
  - { rel: is_driven_by, to: signals_and_slos, strength: 0.5 }
  - { rel: supports, to: review_and_quality, strength: 0.4 }
gradients:
  explicitness: { min: 0.4, max: 0.7 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.5, max: 0.85 }
---
**Leitplanken**
- Dashboards sind Einstiege, nicht Endpunkte: Drilldown-Queries sind wichtiger.
- Standard-Queries versionieren (wie Code).
- Diagnose muss reproduzierbar sein (gleiche Frage → gleiche Query).

**Typische Failure-Modes**
- Dashboard-Sprawl → niemand findet etwas.
- Nur “schöne Charts” → keine Diagnosefähigkeit.
- Queries nicht versioniert → Wissen geht verloren.
