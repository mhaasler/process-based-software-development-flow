---
id: auditability_and_traceability
title: Auditability & Traceability
kind: concept
layer: 3
summary: >
  Stellt Nachvollziehbarkeit sicher: wer hat was geändert/entschieden, wann, warum – über Logs, Git, ADRs, Access-Audit.
core_decision: >
  Welche Spuren sind verpflichtend, damit man Änderungen und Vorfälle rekonstruieren kann?
tags: [governance, observability, security]
links:
  - { rel: depends_on, to: telemetry_design, strength: 0.4 }
  - { rel: depends_on, to: artifacts_and_truth_sources, strength: 0.6 }
  - { rel: requires, to: transparency_and_access, strength: 0.4 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.5, max: 0.85 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- “Wer/Was/Wann/Warum” ist rekonstruierbar (Git + Telemetry + Access logs).
- Auditability ist ein Feature: Queries/Reports sind standardisiert.
- Traceability koppelt Runs (run_id) mit Änderungen (commit, spec version).

**Typische Failure-Modes**
- Keine Spuren → Root cause unmöglich.
- Spuren ohne Zugriff/Queries → Wissen unauffindbar.
- Audit nur nach Incident → zu spät.
