---
id: actionability_and_ownership
title: Actionability & Ownership
kind: concept
layer: 3
summary: >
  Stellt sicher, dass Signale zu Handlungen führen: Zuständigkeiten, Runbooks, Eskalation, klare Verantwortungen.
core_decision: >
  Wer reagiert auf welches Signal – und welche Handlungsoptionen sind definiert?
tags: [observability, operations]
links:
  - { rel: requires, to: dashboards_and_queries, strength: 0.5 }
  - { rel: drives, to: change_control, strength: 0.5 }
  - { rel: triggers, to: incidents_and_postmortems, strength: 0.6 }
  - { rel: requires, to: runbooks_and_playbooks, strength: 0.6 }
gradients:
  explicitness: { min: 0.5, max: 0.8 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Jedes Signal braucht Owner + Reaktionsplan (Runbook-Light).
- Alerts nur, wenn es eine konkrete Aktion gibt.
- Ownership ist ein Artefakt (nicht implizit “macht schon jemand”).

**Typische Failure-Modes**
- Alerts ohne Aktion → Alarmmüdigkeit.
- Ownership diffus → Incidents dauern länger.
- Wissen nur im Kopf → Wiederholte Fehler.
