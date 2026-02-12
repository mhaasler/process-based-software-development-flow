---
id: artifacts_and_truth_sources
title: Artefakte & Truth Sources
kind: concept
layer: 3
summary: >
  Legt fest, welche Artefakte „Wahrheit“ sind (Specs, Policies, ADRs) und was nur Kommunikation/Entwurf ist.
core_decision: >
  Welche Dokumente/Files haben Autorität, und wie wird verhindert, dass Wahrheit zerfasert?
tags: [communication, documentation]
links:
  - { rel: is_expressed_in, to: specification, strength: 0.6 }
  - { rel: is_referenced_by, to: decision_records, strength: 0.6 }
  - { rel: is_guarded_by, to: communication_channels, strength: 0.5 }
  - { rel: is_realized_by, to: specification, strength: 0.6 }
  - { rel: requires, to: transparency_and_access, strength: 0.3 }
  - { rel: constrains, to: ai_assisted_workflow, strength: 0.4 }
gradients:
  explicitness: { min: 0.7, max: 1.0 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- Eine Wahrheit pro Thema: „Single Source of Truth“ (SSOT) je Kategorie.
- Wahrheit muss diffbar/reviewbar sein (Git) – sonst keine Governance.
- KI darf helfen, aber nicht stillschweigend „Wahrheit umschreiben“ ohne Diff.

**Typische Failure-Modes**
- Wiki/Chat als Wahrheit → keine Versionierung, keine Review-Kontrolle.
- Mehrere Truths → Konflikte werden politisch statt technisch gelöst.
- Spec driftet gegen Code → Reviews verlieren Grundlage.
