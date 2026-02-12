---
id: observability_design
title: Observability als Architektur
kind: concept
layer: 3
summary: >
  Entscheidet, welche Signale existieren müssen (Logs/Traces/Metriken), um Verhalten sicher zu verstehen und zu steuern.
core_decision: >
  Welche Signale sind verpflichtend, damit Betrieb, Debugging und Feedback-Schleifen zuverlässig funktionieren?
tags: [architecture, structure, observability]
links:
  - { rel: observes, to: runtime_execution_authority, strength: 0.6 }
  - { rel: validates, to: quality_gates, strength: 0.5 }
  - { rel: feeds, to: change_control, strength: 0.6 }
  - { rel: enables, to: feedback_and_learning, strength: 0.6 }
  - { rel: supports, to: review_and_quality, strength: 0.5 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- Observability ist *Design*: Events/Spans/IDs sind Teil der Contracts.
- Correlation IDs (run_id etc.) als Standard – sonst ist Traceability Zufall.
- Signals müssen zu Entscheidungen führen können (SLOs, Alerts, Regression Checks).

**Typische Failure-Modes**
- “Wir loggen später” → Feedback-Schleife bricht.
- Nur Logs ohne Struktur → keine Kausalität, keine Suche.
- Dashboards ohne Ownership → niemand reagiert, alles wird “Noise”.
