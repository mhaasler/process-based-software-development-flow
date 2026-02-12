---
id: transparency_and_access
title: Transparenz, Zugriff & Datenschutz
kind: concept
layer: 3
summary: >
  Regelt, wer welche Telemetrie sehen darf, wie PII/Security gehandhabt werden, und wie Audit/Compliance passt.
core_decision: >
  Wie wird Transparenz maximiert, ohne Security/Privacy zu verletzen?
tags: [observability, security, governance]
links:
  - { rel: constrains, to: telemetry_design, strength: 0.5 }
  - { rel: is_part_of, to: change_control, strength: 0.4 }
  - { rel: constrains, to: artifacts_and_truth_sources, strength: 0.3 }
  - { rel: requires, to: data_handling_and_privacy, strength: 0.5 }
  - { rel: supports, to: auditability_and_traceability, strength: 0.4 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.5, max: 0.85 }
---
**Leitplanken**
- Zugriff ist policy-basiert (Least Privilege) und auditierbar.
- PII/Secrets niemals „aus Versehen“ loggen (Scrubbing/Allowlists).
- Transparenzregeln sind Teil der Architektur-Policies.

**Typische Failure-Modes**
- Telemetrie leakt Daten → Security/Legal-Impact.
- Zu restriktiv → niemand kann debuggen.
- Keine Auditability → Governance bricht.
