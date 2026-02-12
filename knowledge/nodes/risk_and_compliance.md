---
id: risk_and_compliance
title: Risiko, Compliance & Ausnahmeprozesse
kind: concept
layer: 3
summary: >
  Behandelt Risiken als Entscheidungen: akzeptieren, mitigieren, transferieren – inkl. Ausnahmen (mit Audit).
core_decision: >
  Wie werden Risiken und Ausnahmen sichtbar, auditierbar und zeitlich begrenzt gehandhabt?
tags: [governance, security]
links:
  - { rel: aligns_with, to: threat_modeling, strength: 0.5 }
  - { rel: constrains, to: least_privilege_and_access, strength: 0.4 }
  - { rel: is_informed_by, to: security_incidents, strength: 0.4 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.3, max: 0.6 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Ausnahmen sind timeboxed + owner + rationale + rollback plan.
- Risikoentscheidungen verlinken auf Mitigations (Policy/Gate/Runbook).
- Compliance ist “by default” über Policies/Gates, nicht per Nacharbeit.

**Typische Failure-Modes**
- Ausnahmen werden dauerhaft → Regeln erodieren.
- Risiko wird nur gefühlt → keine Priorisierung.
- Compliance als Papier → reale Systeme weichen ab.
