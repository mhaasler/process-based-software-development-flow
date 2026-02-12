---
id: communication
title: Kommunikation
kind: star
layer: 1
summary: "Entscheidungen darüber, wo Verständigung unverzichtbar ist und wo Artefakte Kommunikation ersetzen."
core_decision: "Wo muss Verständigung explizit stattfinden – und wo reicht Verdichtung in Artefakten?"
tags: [alignment, context, discussion, async, stakeholders]

galaxies: [main]

links:
  - to: process
    rel: enables
    strength: 0.7
  - to: structure
    rel: informs
    strength: 0.5
  - to: governance
    rel: required_by
    strength: 0.4
  - to: implementation
    rel: reduced_by
    strength: 0.4
  - to: observation_transparency
    rel: guided_by
    strength: 0.3

planets: [architecture_conversations, stakeholder_alignment, async_discussion, decision_rationale, conflict_resolution]

gradients:
  explicitness: {min: 0.2, max: 0.8}
  communication_intensity: {min: 0.4, max: 1.0}
  automatable: {min: 0.0, max: 0.4}
  stability: {min: 0.2, max: 0.8}
  centrality: {min: 0.3, max: 0.8}

origin:
  seed: true
  synthetic: true
  external: true
---

- Kommunikation sinkt bei Routine-Ausführung, bleibt hoch bei Unsicherheit, Konflikten, Architektur.
- Artefakte (Specs/ADRs) sind verdichtete Kommunikation, nicht weniger Kommunikation.
- Kernfrage: wo findet Verständigung statt – und wie wird sie stabilisiert?
