---
id: requirements
title: Anforderungen
kind: concept
layer: 3
summary: >
  Erfasst, priorisiert und versioniert Anforderungen (funktional + nicht-funktional) inklusive Trade-offs.
core_decision: >
  Welche Anforderungen sind verbindlich, welche verhandelbar – und wie werden Änderungen kontrolliert?
tags: [process, seed]
links:
  - { rel: is_informed_by, to: problem_framing, strength: 0.8 }
  - { rel: constrains, to: specification, strength: 0.9 }
  - { rel: shapes, to: planning_and_work, strength: 0.7 }
  - { rel: shapes, to: interfaces_and_contracts, strength: 0.6 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.6, max: 0.9 }
  automatable: { min: 0.3, max: 0.5 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.7, max: 0.9 }
---
**Leitplanken**
- Trenne: *Must / Should / Could / Won’t* (oder ähnlich) – sonst gibt’s keine Steuerung.
- Nicht-Funktionales ist erst „real“, wenn es test-/beobachtbar wird (SLOs, Limits, Policies).
- Versioniere Anforderungen wie Code: diffbar, reviewbar, rückrollbar.

**Typische Failure-Modes**
- Requirements werden als „Ticket-Text“ behandelt → keine Invarianten, keine Tests.
- NFRs werden vergessen → Betrieb/Observability fällt hinten runter.
- Keine Change-Control → Spezifikation driftet unbemerkt.
