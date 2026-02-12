---
id: structure
title: Struktur
kind: star
layer: 1
summary: "Entscheidungen über Grenzen, Verantwortlichkeiten und Abhängigkeiten."
core_decision: "Wie schneiden wir Verantwortlichkeiten, Grenzen und Abhängigkeiten so, dass Veränderung kontrollierbar bleibt?"
tags: [architecture, boundaries, ownership, dependency]

galaxies: [main]

links:
  - to: process
    rel: coevolves_with
    strength: 0.6
  - to: governance
    rel: constrained_by
    strength: 0.6
  - to: implementation
    rel: realized_by
    strength: 0.7
  - to: observation_transparency
    rel: evaluated_by
    strength: 0.4
  - to: communication
    rel: depends_on
    strength: 0.5

planets: [boundaries, interfaces, invariants, dependency_rules, adr]

gradients:
  explicitness: {min: 0.5, max: 0.95}
  communication_intensity: {min: 0.2, max: 0.7}
  automatable: {min: 0.1, max: 0.4}
  stability: {min: 0.5, max: 0.95}
  centrality: {min: 0.6, max: 0.95}

origin:
  seed: true
  synthetic: true
  external: true
---

- Struktur ist nicht nur Codeform: sie ist Verantwortungs- und Veränderungsarchitektur.
- Gute Struktur reduziert Kopplung und macht Regeln/Gates präziser.
- Strukturentscheidungen sind langlebig, aber bewusst evolvierbar.
