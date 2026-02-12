---
id: specification
title: Spezifikation
kind: concept
layer: 3
summary: >
  Macht Verhalten, Invarianten, Schnittstellen und Tests explizit – Specs sind die führende Wahrheit.
core_decision: >
  Was muss explizit sein, damit Implementierung nicht zur Spekulation wird und Änderungen kontrollierbar bleiben?
tags: [process, seed]
links:
  - { rel: is_constrained_by, to: requirements, strength: 0.9 }
  - { rel: decomposes_into, to: planning_and_work, strength: 0.8 }
  - { rel: is_validated_by, to: review_and_quality, strength: 0.7 }
  - { rel: is_controlled_by, to: change_control, strength: 0.7 }
  - { rel: includes, to: interfaces_and_contracts, strength: 0.6 }
  - { rel: is_a_truth_source_for, to: artifacts_and_truth_sources, strength: 0.5 }
gradients:
  explicitness: { min: 0.7, max: 1.0 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.8, max: 1.0 }
---
**Leitplanken**
- Definiere Invarianten (was *immer* gelten muss) und Boundaries (was *nicht* gemacht wird).
- Jede Spez-Aussage braucht eine Validierung (Unit/Smoke/Contract/Observability-Signal).
- Specs sollen kompakt sein: Regeln > Erklärtexte.

**Typische Failure-Modes**
- Spec = „Prosa“ ohne Testbarkeit → Implementierung übernimmt die Deutungshoheit.
- Zu detailreich (Mikro-Design) → Specs werden schnell veraltet und ignoriert.
- Änderungen passieren nur im Code → Drift und Review wird blind.
