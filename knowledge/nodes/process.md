---
id: process
title: Prozess
kind: star
layer: 1
summary: "Entscheidungen darüber, wie Struktur- und Regelentscheidungen entstehen, validiert und verändert werden."
core_decision: "Wie organisieren wir Entstehung, Validierung und Änderung von Struktur- und Regelentscheidungen?"
tags: [workflow, iteration, handoffs, decision_loop]

galaxies: [main, process_galaxy]

links:
  - to: communication
    rel: depends_on
    strength: 0.7
  - to: governance
    rel: constrained_by
    strength: 0.6
  - to: implementation
    rel: realized_by
    strength: 0.5
  - to: observation_transparency
    rel: evaluated_by
    strength: 0.7
  - to: structure
    rel: coevolves_with
    strength: 0.6

planets: [handoffs, decision_points, iteration, review_mechanics, spec_loop, change_management]

gradients:
  explicitness: {min: 0.3, max: 0.9}
  communication_intensity: {min: 0.3, max: 0.9}
  automatable: {min: 0.2, max: 0.8}
  stability: {min: 0.2, max: 0.8}
  centrality: {min: 0.4, max: 0.9}

origin:
  seed: true
  synthetic: true
  external: true
---

- Prozess ist die Architektur der Feedbackzyklen: wo wird entschieden, wo validiert, wo gelernt?
- Agil/Wasserfall ist hier Strukturfrage: linear vs. iterativ, spätes vs. frühes Feedback.
- KI senkt Ausführungskosten und verschiebt Engpässe zu Entscheidung & Validierung.
