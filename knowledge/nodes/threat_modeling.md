---
id: threat_modeling
title: Threat Modeling & Risk Decisions
kind: concept
layer: 3
summary: >
  Macht Angriffsflächen und Risiken explizit und koppelt sie an konkrete Gegenmaßnahmen, Policies und Gates.
core_decision: >
  Welche Risiken akzeptieren wir bewusst – und welche müssen technisch verhindert werden?
tags: [security, architecture]
links:
  - { rel: informs, to: architecture_boundaries, strength: 0.5 }
  - { rel: informs, to: quality_gates, strength: 0.5 }
  - { rel: triggers, to: decision_records, strength: 0.4 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.3, max: 0.6 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Risiken werden als Entscheidungen behandelt (mit Owner, Kontext, Mitigation).
- Threat Model ist updatebar: nach Incidents und großen Architekturänderungen.
- Fokus auf größte Angriffsflächen (Blast radius, secrets, supply chain).

**Typische Failure-Modes**
- Threat model als einmaliges PDF → veraltet sofort.
- Nur hypothetisch, keine Maßnahmen → Theater.
- Risiken werden „implizit akzeptiert“ → später Überraschungen.
