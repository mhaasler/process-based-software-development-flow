---
id: governance_feedback_loops
title: Governance-Feedback-Loops
kind: concept
layer: 3
summary: >
  Schließt den Kreis: Incidents, SLOs und Reviews führen zu Policy-/Gate-/Spec-Änderungen (nicht nur zu Hotfixes).
core_decision: >
  Wie wird aus Beobachtung ein Governance-Update (Policy/Gate/Spec) statt ad-hoc Workarounds?
tags: [governance, learning]
links:
  - { rel: depends_on, to: feedback_and_learning, strength: 0.6 }
  - { rel: updates, to: policy_system, strength: 0.5 }
  - { rel: updates, to: quality_gates, strength: 0.5 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Postmortems erzeugen Policy/Gate/Spec Diffs, nicht nur Tasks.
- “Regel wird real”: neue Checks/Alerts/Runbooks folgen aus Learnings.
- Governance misst sich am Outcome: weniger Wiederholungsfehler, schnellere Entscheidungen.

**Typische Failure-Modes**
- Learnings bleiben Folien → System bleibt unverändert.
- Regeln ohne Messung → keine Wirkung.
- Zu viele Feedback-Loops → Overhead ohne Priorisierung.
