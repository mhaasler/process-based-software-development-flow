---
id: security_safety
title: Security & Safety
kind: core
layer: 2
summary: >
  Security/Safety sind Systementscheidungen: Secrets, Isolation, Zugriff, Supply Chain und Datenschutz – erzwingbar, nicht optional.
core_decision: >
  Welche Sicherheitsregeln sind nicht verhandelbar – und wie werden sie durch Prozesse, Policies und Gates automatisch durchgesetzt?
tags: [core, security]
links:
  - { rel: expands_to, to: secrets_and_passwords, strength: 0.6 }
  - { rel: expands_to, to: sandboxing_and_isolation, strength: 0.6 }
  - { rel: expands_to, to: least_privilege_and_access, strength: 0.6 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.5, max: 0.85 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.7, max: 1.0 }
---
**Leitplanken**
- Security ist „by design“: Defaults, Policies, Gates – nicht nachträgliches Review.
- Secrets/PII dürfen nie „aus Versehen“ in Logs/Repos landen (Scrubbing/Allowlists).
- Isolation (Sandbox) ist Pflicht für Code-Ausführung und riskante Tools.

**Typische Failure-Modes**
- Security wird als Checkliste behandelt → driftet und wird umgangen.
- Secrets in Env/Logs/Chat → sofortiger Schaden.
- Keine Ownership/Automatisierung → Regeln sind nur Wunschdenken.
