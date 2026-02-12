---
id: review_and_quality
title: Review & Qualität
kind: concept
layer: 3
summary: >
  Review ist ein Gate: Specs, Code, Tests und Risiken werden gegen explizite Regeln geprüft.
core_decision: >
  Was wird geprüft, nach welchen Regeln – und wie verhindert man Regressions systematisch statt ritualisiert?
tags: [process, seed]
links:
  - { rel: consumes, to: execution, strength: 0.9 }
  - { rel: validates, to: specification, strength: 0.7 }
  - { rel: yields, to: feedback_and_learning, strength: 0.7 }
  - { rel: is_supported_by, to: quality_gates, strength: 0.7 }
  - { rel: requires, to: observability_design, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.7, max: 0.9 }
---
**Leitplanken**
- Reviews folgen einer Checkliste, die aus Specs/Policies kommt (nicht aus Geschmack).
- Qualität ist „Shift-left“: Gates so früh wie möglich (Lint → Unit → Contract → Smoke).
- Review muss *Risiko* adressieren: was könnte brechen, wie merken wir es?

**Typische Failure-Modes**
- Review als Stil-Debatte → Regeln fehlen, Ergebnis ist inkonsistent.
- Tests sind optional → Regression wird zur Normalität.
- Kein Gate gegen Spec-Drift → Code ändert Verhalten ohne Spec-Update.
