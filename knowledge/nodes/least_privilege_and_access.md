---
id: least_privilege_and_access
title: Least Privilege & Access Control
kind: concept
layer: 3
summary: >
  Minimiert Rechte konsequent: Rollen, Tokens, Scope, Zeitbegrenzung, Audit – für Menschen und Systeme.
core_decision: >
  Welche minimalen Rechte sind nötig – und wie werden Ausnahmen auditierbar gemacht?
tags: [security, governance]
links:
  - { rel: constrains, to: transparency_and_access, strength: 0.6 }
  - { rel: supports, to: secrets_and_passwords, strength: 0.6 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Rollen + kurzlebige Tokens statt “ewige” Keys.
- Scope so klein wie möglich (read-only, env-limited, timeboxed).
- Jede Ausnahme ist sichtbar (Audit + Owner).

**Typische Failure-Modes**
- Admin-by-default → Blast radius maximal.
- Tokens überall wiederverwendet → lateraler Zugriff.
- Keine Auditability → niemand merkt Missbrauch.
