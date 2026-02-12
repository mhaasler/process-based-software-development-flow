---
id: core_decisions
title: Struktur- & Regelentscheidungen
kind: core
layer: 0
summary: "Entscheidungen über Struktur und Regeln bilden den Kern des Modells."
core_decision: "Welche Strukturen und Regeln sollen gelten – und wie bleiben sie veränderbar, ohne beliebig zu werden?"
tags: [core, decisions, structure, rules]

galaxies: [main]

links:
  - to: structure
    rel: shapes
    strength: 0.9
  - to: process
    rel: shaped_by
    strength: 0.8
  - to: governance
    rel: constrained_by
    strength: 0.7
  - to: implementation
    rel: realized_by
    strength: 0.8
  - to: communication
    rel: informed_by
    strength: 0.6
  - to: observation_transparency
    rel: evaluated_by
    strength: 0.7

planets: [architecture_decisions, process_rules, policies, adr, definition_of_done]

gradients:
  explicitness: {min: 0.3, max: 0.9}
  communication_intensity: {min: 0.2, max: 0.8}
  automatable: {min: 0.1, max: 0.6}
  stability: {min: 0.3, max: 0.9}
  centrality: {min: 0.4, max: 0.9}

origin:
  seed: true
  synthetic: true
  external: true
---

- Fokus: Entscheidungen über Struktur (Schnitt, Grenzen) und Regeln (Policies, Gates, DoD).
- Diese Entscheidungen entstehen, wirken, werden beobachtet und korrigiert.
- Mit KI verschiebt sich der Schwerpunkt von Implementierung hin zur Gestaltung von Entscheidungs- und Ausführungsprozessen.
