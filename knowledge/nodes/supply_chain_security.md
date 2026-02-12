---
id: supply_chain_security
title: Supply-Chain Security
kind: concept
layer: 3
summary: >
  Schützt Abhängigkeiten und Build-Pipeline: Pinning, Signaturen, SBOM, Scans, Repro-Builds.
core_decision: >
  Wie wird verhindert, dass Dependencies/Build-Pipeline zur Angriffsfläche werden?
tags: [security, build]
links:
  - { rel: is_enforced_by, to: quality_gates, strength: 0.6 }
  - { rel: constrains, to: module_composition, strength: 0.4 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.2, max: 0.5 }
  automatable: { min: 0.7, max: 1.0 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Pinning/Lockfiles sind Pflicht; Updates sind bewusst und reviewbar.
- SBOM + Signaturen, wo möglich; Scans als Gate.
- Reproduzierbare Builds reduzieren „works on my machine“-Risiko.

**Typische Failure-Modes**
- Wild-west Updates → unerklärliche Brüche/Backdoors.
- Scans ohne Konsequenz → “rot ist normal”.
- Unpinned transitive deps → unsichtbare Angriffsfläche.
