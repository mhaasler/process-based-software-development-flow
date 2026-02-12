---
id: reproducible_builds
title: Reproduzierbare Builds & Toolchain Pinning
kind: concept
layer: 3
summary: >
  Macht Builds deterministisch: Versionen pinnen, Lockfiles, definierte Toolchains, gleiche Inputs → gleiche Outputs.
core_decision: >
  Welche Inputs/Versionen müssen gepinnt sein, damit Builds und Tests reproduzierbar sind?
tags: [tooling, build]
links:
  - { rel: is_enforced_by, to: quality_gates, strength: 0.6 }
  - { rel: reduces, to: supply_chain_security, strength: 0.4 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.2, max: 0.5 }
  automatable: { min: 0.7, max: 1.0 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Toolchain/Deps pinnen (Lockfiles, versions, env).
- Rebuilds müssen gleich sein (oder Abweichung erklärbar).
- Updates sind bewusst: changelog + tests + rollback story.

**Typische Failure-Modes**
- “latest” überall → random breakage.
- Keine Lockfiles → transitive Überraschungen.
- Builds nicht replaybar → Debugging wird Spekulation.
