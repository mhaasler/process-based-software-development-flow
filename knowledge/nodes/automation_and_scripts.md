---
id: automation_and_scripts
title: Automatisierung & Skripte (Gates, Generators)
kind: concept
layer: 3
summary: >
  Codiert Standards als Tools: Generatoren, Gates, Lint/Test-Runner, Knowledge-Gate – möglichst fail-fast.
core_decision: >
  Welche Regeln müssen als Skript/Gate existieren, damit sie nicht verhandelbar sind?
tags: [tooling, process]
links:
  - { rel: implements, to: quality_gates, strength: 0.6 }
  - { rel: supports, to: planning_and_work, strength: 0.4 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.2, max: 0.5 }
  automatable: { min: 0.8, max: 1.0 }
  stability: { min: 0.5, max: 0.85 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- “One command” für Checks (Gate-Skripte).
- Generatoren reduzieren menschliche Variabilität (Templates, Facades, Specs).
- Fail-fast + klare Fehlermeldungen (Fix-Hinweise).

**Typische Failure-Modes**
- Skripte sind optional → niemand nutzt sie.
- Zu komplex → wird umgangen.
- Keine Standard-Entry-Points → jeder macht’s anders.
