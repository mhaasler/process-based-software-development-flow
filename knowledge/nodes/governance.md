---
id: governance
title: Governance
kind: star
layer: 1
summary: "Entscheidungen darüber, wer Struktur/Regeln verändern darf und welche Sicherungen gelten."
core_decision: "Wer darf welche Struktur- und Regeländerungen durchführen – unter welchen Bedingungen und mit welcher Auditierbarkeit?"
tags: [security, permissions, audit, policy, risk]

galaxies: [main]

links:
  - to: process
    rel: shapes
    strength: 0.6
  - to: implementation
    rel: constrains
    strength: 0.8
  - to: structure
    rel: protects
    strength: 0.6
  - to: observation_transparency
    rel: depends_on
    strength: 0.5
  - to: communication
    rel: requires
    strength: 0.4

planets: [roles, permissions, secrets_management, sandboxing, audit_trail, merge_policy]

gradients:
  explicitness: {min: 0.6, max: 1.0}
  communication_intensity: {min: 0.2, max: 0.7}
  automatable: {min: 0.3, max: 0.8}
  stability: {min: 0.6, max: 1.0}
  centrality: {min: 0.5, max: 1.0}

origin:
  seed: true
  synthetic: true
  external: true
---

- Governance beantwortet: Automatisierung – ja, aber in welchem Rahmen?
- Hier sitzen Secrets (KeePass/Vault), Sandboxen, Rollen, Policies, Audit.
- Gute Governance ermöglicht Geschwindigkeit ohne Kontrollverlust.
