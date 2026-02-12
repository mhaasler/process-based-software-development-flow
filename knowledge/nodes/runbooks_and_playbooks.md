---
id: runbooks_and_playbooks
title: Runbooks & Playbooks
kind: concept
layer: 3
summary: >
  Macht Reaktion reproduzierbar: standardisierte Diagnose- und Handlungsabläufe, die aus Signalen zu konkreten Aktionen führen.
core_decision: >
  Welche Runbooks sind verpflichtend, und wie bleiben sie aktuell (statt zu veralten)?
tags: [observability, operations]
links:
  - { rel: is_required_by, to: actionability_and_ownership, strength: 0.6 }
  - { rel: supports, to: incidents_and_postmortems, strength: 0.6 }
  - { rel: is_supported_by, to: dashboards_and_queries, strength: 0.6 }
  - { rel: uses, to: signals_and_slos, strength: 0.4 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Runbook = „wenn Signal X, dann mache Y“ (inkl. Query/Command/Check).
- Versioniere Runbooks wie Code, verlinke sie an Signals/Services/Owners.
- Pflege über Ereignisse: jedes Incident aktualisiert Runbooks oder erzeugt neue.

**Typische Failure-Modes**
- Runbooks veralten → im Incident wertlos.
- Nur „Wiki-Text“ ohne Commands/Queries → nicht ausführbar.
- Kein Ownership → niemand pflegt, niemand vertraut.
