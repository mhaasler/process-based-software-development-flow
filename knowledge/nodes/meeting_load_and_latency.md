---
id: meeting_load_and_latency
title: Meeting-Last & Entscheidungs-Latenz
kind: concept
layer: 3
summary: >
  Optimiert Kommunikationskosten: weniger Meetings, schnellere Entscheidungen, ohne Governance/Qualität zu verlieren.
core_decision: >
  Wie wird Entscheidungsfähigkeit erhöht, während Kommunikationslast sinkt?
tags: [communication, operations]
links:
  - { rel: is_reduced_by, to: communication_channels, strength: 0.6 }
  - { rel: is_reduced_by, to: quality_gates, strength: 0.5 }
gradients:
  explicitness: { min: 0.4, max: 0.7 }
  communication_intensity: { min: 0.7, max: 1.0 }
  automatable: { min: 0.4, max: 0.8 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.5, max: 0.85 }
---
**Leitplanken**
- Ersetze Status-Meetings durch Artefakte + Gates + klare Ownership.
- Entscheidungen „pullen“: Vorlagen/Checklisten reduzieren Sync-Bedarf.
- KI kann Latenz senken (Drafts, Diffs), aber Autorität bleibt geregelt (Truth Sources).

**Typische Failure-Modes**
- Meeting-Reduktion ohne Artefakte → Chaos statt Geschwindigkeit.
- Entscheidungen werden ausgelagert → niemand ist Owner.
- KI erzeugt viel Text → mehr Lärm, nicht mehr Klarheit.
