---
id: implementation
title: Umsetzung
kind: star
layer: 1
summary: "Entscheidungen darüber, wie Regeln operativ wirksam werden (Code, Tests, Automatisierung, Agenten)."
core_decision: "Wie werden Struktur- und Regelentscheidungen operational wirksam – reproduzierbar, prüfbar und sicher?"
tags: [code, tests, cicd, automation, agents]

galaxies: [main]

links:
  - to: process
    rel: depends_on
    strength: 0.5
  - to: governance
    rel: constrained_by
    strength: 0.7
  - to: observation_transparency
    rel: enables
    strength: 0.6
  - to: structure
    rel: depends_on
    strength: 0.7
  - to: communication
    rel: reduced_by
    strength: 0.4

planets: [code, tests, gates, cicd, agent_orchestration, sandbox_execution]

gradients:
  explicitness: {min: 0.5, max: 1.0}
  communication_intensity: {min: 0.1, max: 0.5}
  automatable: {min: 0.5, max: 1.0}
  stability: {min: 0.3, max: 0.9}
  centrality: {min: 0.3, max: 0.8}

origin:
  seed: true
  synthetic: true
  external: true
---

- Umsetzung ist die Wirksamkeitsschicht der Entscheidungen (Ableitung, Generierung, Automatisierung).
- Kritisch bleiben Validierbarkeit (Tests/Gates) und Begrenzung (Sandbox/Permissions).
- Umsetzung ist nicht das Ziel, sondern die operative Konsequenz.
