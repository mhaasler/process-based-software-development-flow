---
id: secrets_and_passwords
title: Secrets & Passwort-Management (z.B. KeePass)
kind: concept
layer: 3
summary: >
  Regelt, wie Secrets erzeugt, gespeichert, geteilt, rotiert und auditierbar verwendet werden – ohne Leaks.
core_decision: >
  Wo liegen Secrets, wer darf sie nutzen, und wie wird Leak-Risiko technisch minimiert?
tags: [security, operations]
links:
  - { rel: requires, to: least_privilege_and_access, strength: 0.6 }
  - { rel: is_guarded_by, to: quality_gates, strength: 0.5 }
  - { rel: is_applied_in, to: dev_secrets_and_env, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.5, max: 0.8 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Keine Secrets in Repo/Chat/Logs. Punkt.
- Zugriff über Rollen/Policies; Rotation/Revocation ist geplant, nicht ad-hoc.
- Shared Secrets sind minimiert; “break glass” ist auditierbar.

**Typische Failure-Modes**
- KeePass/Secrets als „Team-Notiz“ → kein Audit, kein Prinzip.
- Rotation nie gemacht → Zeitbombe.
- Leaks durch Debug-Logs/Stacktraces → sofortiger Impact.
