---
id: ownership_and_raci
title: Ownership (RACI / Verantwortungen)
kind: concept
layer: 3
summary: >
  Legt fest, wer wofür Owner ist: Services, Domains, Policies, Runbooks, Data – inkl. Eskalationspfade.
core_decision: >
  Wer ist Owner für welche Entscheidungen und Artefakte – und wie wird Ownership sichtbar gemacht?
tags: [governance, operations]
links:
  - { rel: enables, to: actionability_and_ownership, strength: 0.6 }
  - { rel: supports, to: change_control, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.3, max: 0.6 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.95 }
---
**Leitplanken**
- Ownership ist ein Artefakt (file, registry), nicht implizit.
- Jede kritische Komponente hat Owner + Backup + Eskalation.
- Ohne Owner kein Alert, kein SLO, kein Policy-Change.

**Typische Failure-Modes**
- “Alle sind zuständig” → niemand ist zuständig.
- Ownership nur sozial → bei Wechseln geht Wissen verloren.
- Eskalation unklar → Incidents dauern unnötig.
