---
id: incidents_and_postmortems
title: Incidents & Postmortems
kind: concept
layer: 3
summary: >
  Macht Störungen zu Lern- und Systemänderungen: strukturierte Diagnose, Ursachenanalyse, Maßnahmen, Nachverfolgung.
core_decision: >
  Wie werden Incidents so behandelt, dass daraus systematische Verbesserungen (Specs/Policies/Gates) entstehen?
tags: [observability, operations, learning]
links:
  - { rel: is_triggered_by, to: actionability_and_ownership, strength: 0.6 }
  - { rel: produces, to: feedback_and_learning, strength: 0.7 }
  - { rel: produces, to: change_control, strength: 0.5 }
  - { rel: is_supported_by, to: dashboards_and_queries, strength: 0.5 }
  - { rel: updates, to: runbooks_and_playbooks, strength: 0.5 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.6, max: 0.9 }
  automatable: { min: 0.3, max: 0.6 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Postmortems sind blameless, aber nicht folgenlos: sie erzeugen konkrete Änderungen.
- Jede Maßnahme wird einem Artefakt zugeordnet (Spec/Policy/Gate/Runbook) und bekommt Owner+Deadline.
- Ursache wird als Systemfehler modelliert (fehlendes Signal, fehlendes Gate, falscher Contract, fehlende Ownership).

**Typische Failure-Modes**
- Postmortem als Ritual → keine Actions, keine Veränderung.
- „Human error“ als Enderklärung → System bleibt fragil.
- Maßnahmen ohne Tracking → Wiederholungsfehler.
