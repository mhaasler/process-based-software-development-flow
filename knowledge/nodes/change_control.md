---
id: change_control
title: Change Control & Evolution
kind: concept
layer: 3
summary: >
  Steuert Änderungen an Specs/Policies/Architektur über Versionierung, Review und kompatible Migrationspfade.
core_decision: >
  Wie werden Änderungen kontrolliert, damit das System evolviert ohne schleichende Drift?
tags: [architecture, governance]
links:
  - { rel: is_constrained_by, to: architecture_boundaries, strength: 0.7 }
  - { rel: is_supported_by, to: quality_gates, strength: 0.6 }
  - { rel: is_informed_by, to: observability_design, strength: 0.6 }
  - { rel: controls, to: specification, strength: 0.7 }
  - { rel: is_informed_by, to: feedback_and_learning, strength: 0.6 }
  - { rel: is_documented_by, to: decision_records, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.5, max: 0.8 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- “Spec-first”: Änderungen werden als Spec/Policy-Diff sichtbar, Code folgt.
- Breaking Changes brauchen Migrationsstrategie (parallel run, adapters, versioned contracts).
- Jede Änderung muss eine Beobachtungs-/Rollback-Story haben.

**Typische Failure-Modes**
- Änderungen nur im Code → Spec driftet.
- Breaking Changes ohne Plan → Downtime/Chaos.
- Keine Rückkopplung aus Betrieb → Evolution wird blind.
