---
id: observation_transparency
title: Beobachtung & Transparenz
kind: star
layer: 1
summary: "Entscheidungen darüber, was sichtbar sein muss (Wirkung, Drift, Feedback) – strategisch und technisch."
core_decision: "Was muss sichtbar sein, damit Struktur- und Regelentscheidungen überprüfbar und korrigierbar bleiben?"
tags: [observability, monitoring, metrics, feedback, learning]

galaxies: [main]

links:
  - to: process
    rel: improves
    strength: 0.7
  - to: governance
    rel: enables
    strength: 0.5
  - to: implementation
    rel: depends_on
    strength: 0.6
  - to: structure
    rel: evaluated_by
    strength: 0.4
  - to: communication
    rel: informs
    strength: 0.3

planets: [monitoring, observability, tracing, logs, metrics, drift, rework, decision_latency]

gradients:
  explicitness: {min: 0.5, max: 1.0}
  communication_intensity: {min: 0.1, max: 0.6}
  automatable: {min: 0.4, max: 0.9}
  stability: {min: 0.3, max: 0.9}
  centrality: {min: 0.3, max: 0.8}

origin:
  seed: true
  synthetic: true
  external: true
---

- Beobachtung verbindet strategische Wirkung (Drift/Rework/Entscheidungs-Latenz) mit technischer Sichtbarkeit (Logs/Traces/Metriken).
- Transparenz steuert, wo Regeln angepasst werden müssen.
- Ohne Beobachtung werden Regeln dogmatisch oder zufällig.
