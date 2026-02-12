---
id: telemetry_design
title: Telemetrie-Design (Logs/Traces/Metriken)
kind: concept
layer: 3
summary: >
  Entscheidet, welche Events/Spans/IDs existieren und wie Korrelation (run_id etc.) garantiert wird.
core_decision: >
  Welche Telemetrie ist verpflichtend, damit Kausalität und Debugging zuverlässig sind?
tags: [observability, architecture]
links:
  - { rel: is_part_of, to: observability_design, strength: 0.7 }
  - { rel: supports, to: runtime_execution_authority, strength: 0.5 }
  - { rel: enables, to: feedback_and_learning, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Korrelation ist Pflicht: run_id / request_id / entity_id als Standard.
- Strukturierte Logs und stabile Event-Namen (sonst keine Queries).
- Traces sind „Prozess-Sicht“, Logs sind „Detail-Sicht“ – beide bewusst designen.

**Typische Failure-Modes**
- Unstrukturierte Logs → keine Suche, keine Aggregation.
- IDs fehlen → keine Kausalität, nur Vermutungen.
- Telemetrie nur lokal → Betrieb ist blind.
