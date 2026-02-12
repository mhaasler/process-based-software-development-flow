---
id: security_incidents
title: Security Incidents & Response
kind: concept
layer: 3
summary: >
  Definiert Reaktion auf Security-Vorfälle: Detection, Containment, Rotation, Kommunikation, Postmortem, Learnings.
core_decision: >
  Wie reagieren wir auf Security-Vorfälle schnell und kontrolliert – inklusive Rotation/Revocation und Lessons Learned?
tags: [security, operations]
links:
  - { rel: depends_on, to: signals_and_slos, strength: 0.4 }
  - { rel: depends_on, to: actionability_and_ownership, strength: 0.5 }
  - { rel: uses, to: runbooks_and_playbooks, strength: 0.5 }
  - { rel: produces, to: change_control, strength: 0.5 }
  - { rel: updates, to: risk_and_compliance, strength: 0.4 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.6, max: 0.9 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Detection → Containment → Rotation/Revocation → Recovery → Postmortem.
- Security-Incidents haben eigene Playbooks (nicht nur „normaler Incident“).
- Kommunikation ist geregelt (need-to-know, audit, compliance).

**Typische Failure-Modes**
- Kein Rotation-Plan → Keys bleiben kompromittiert.
- Zu spät eskaliert → Blast radius wächst.
- Learnings nicht in Policies/Gates → Wiederholung.
