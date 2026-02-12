---
id: dev_secrets_and_env
title: Dev-Secrets & Environment Hygiene
kind: concept
layer: 3
summary: >
  Regelt Secrets im Dev: lokale Stores (KeePass/Keychain), .env Policies, Masking, Rotation, keine Leaks.
core_decision: >
  Wie nutzen Devs Secrets lokal, ohne sie zu kopieren/zu leaken – und wie wird das enforced?
tags: [tooling, security]
links:
  - { rel: depends_on, to: secrets_and_passwords, strength: 0.6 }
  - { rel: is_enforced_by, to: quality_gates, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.5, max: 0.85 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Secrets nie in Git, nie in Logs, nie in Tickets.
- Masking/Scanning als Gate (pre-commit oder build gate).
- Dev-Access ist least-privilege und timeboxed, wo möglich.

**Typische Failure-Modes**
- .env im Repo → Leak.
- Debug-Prints → Leak.
- Shared dev credentials → kein Audit, hoher Blast Radius.
