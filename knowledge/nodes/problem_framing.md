---
id: problem_framing
title: Problem Framing
kind: concept
layer: 3
summary: >
  Klärt Problem, Kontext, Constraints und Erfolgskriterien so, dass Menschen und KI dieselbe Aufgabe lösen.
core_decision: >
  Wie wird das Problem so gerahmt, dass Ziele, Grenzen und Erfolg/Fehlschlag operationalisierbar sind?
tags: [process, seed]
links:
  - { rel: informs, to: requirements, strength: 0.8 }
  - { rel: anchors, to: specification, strength: 0.6 }
  - { rel: is_refined_by, to: feedback_and_learning, strength: 0.7 }
  - { rel: implies, to: architecture_boundaries, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.6, max: 0.9 }
  automatable: { min: 0.2, max: 0.4 }
  stability: { min: 0.3, max: 0.6 }
  centrality: { min: 0.7, max: 0.9 }
---
**Leitplanken**
- Definiere *Outcome* (Wirkung) und *Scope* (Nicht-Ziele) explizit.
- Nenne harte Constraints (Security, Legal, Budget, Timebox, Betrieb).
- Formuliere ein „Stop-Kriterium“ (woran erkennst du, dass du *nicht* weiter optimierst).

**Typische Failure-Modes**
- „Alles ist wichtig“ → Scope explodiert, Specs werden beliebig.
- Erfolg ist nur „gefühlt“ → später kein sauberes Review/Monitoring möglich.
- KI optimiert auf falsche Proxy-Ziele (z.B. Code statt Outcome).
