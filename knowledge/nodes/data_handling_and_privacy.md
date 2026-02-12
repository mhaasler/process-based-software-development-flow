---
id: data_handling_and_privacy
title: Datenhandling & Privacy
kind: concept
layer: 3
summary: >
  Legt fest, wie Daten klassifiziert, minimiert, verarbeitet und gespeichert werden (inkl. PII, Logs, Retention).
core_decision: >
  Welche Daten dürfen wohin, wie lange – und wie wird das technisch abgesichert?
tags: [security, privacy, governance]
links:
  - { rel: constrains, to: telemetry_design, strength: 0.5 }
  - { rel: constrains, to: artifacts_and_truth_sources, strength: 0.4 }
  - { rel: aligns_with, to: transparency_and_access, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.5, max: 0.85 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Data classification (PII/Secrets/Public) ist explizit und enforced.
- Retention/Deletion ist Teil des Designs, nicht nachträglich.
- Logging ist allowlist-basiert (was darf raus), nicht denylist-basiert.

**Typische Failure-Modes**
- PII in Logs/Traces → Compliance/Security-Fail.
- Keine Retention → Datenhaufen, Risiko steigt.
- “Wir anonymisieren später” → passiert nie.
