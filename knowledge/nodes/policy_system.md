---
id: policy_system
title: Policies & Regelwerk (Verbindlichkeit)
kind: concept
layer: 3
summary: >
  Definiert Policies als durchsetzbare Regeln: Architekturregeln, Security-Policies, Spec-Regeln, Review-Regeln.
core_decision: >
  Welche Regeln sind verbindlich, und wie werden sie als Gates/Checks technisch erzwungen?
tags: [governance, quality]
links:
  - { rel: is_enforced_by, to: quality_gates, strength: 0.7 }
  - { rel: is_versioned_by, to: change_control, strength: 0.6 }
gradients:
  explicitness: { min: 0.7, max: 1.0 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.7, max: 1.0 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- Policies sind kurz, testbar und als Gate ausführbar.
- Jede Policy hat Motivation + Beispiel + “wie prüfen wir’s?”.
- Policies leben in Git, Änderungen sind reviewpflichtig.

**Typische Failure-Modes**
- Policies als Prosa → nicht enforcebar.
- Viele Policies ohne Priorisierung → werden ignoriert.
- Änderungen ohne Diff/Review → Governance driftet.
