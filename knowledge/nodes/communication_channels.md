---
id: communication_channels
title: Kanäle & Synchronisation
kind: concept
layer: 3
summary: >
  Definiert, welche Kommunikation synchron vs asynchron läuft und wie Entscheidungen in Artefakte überführt werden.
core_decision: >
  Welche Themen brauchen Sync, welche müssen Artefakt-getrieben Async sein – und wie wird das erzwungen?
tags: [communication]
links:
  - { rel: guards, to: artifacts_and_truth_sources, strength: 0.5 }
  - { rel: reduces, to: meeting_load_and_latency, strength: 0.6 }
gradients:
  explicitness: { min: 0.5, max: 0.8 }
  communication_intensity: { min: 0.6, max: 0.9 }
  automatable: { min: 0.3, max: 0.6 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Sync ist teuer: benutze es für Ambiguität/Komplexität, nicht für Status.
- Async braucht Artefakte (Spec/ADR/Checklist), sonst wird es „lose Meinung“.
- Definiere Hand-off-Regeln: Chat/Meeting → ADR/Spec-Diff.

**Typische Failure-Modes**
- Alles Sync → Skalierung bricht, Entscheidungen verlangsamen.
- Alles Async → Alignment fehlt, Missverständnisse explodieren.
- Keine Hand-offs → Wahrheit bleibt im Gespräch stecken.
