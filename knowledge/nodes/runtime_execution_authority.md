---
id: runtime_execution_authority
title: Runtime & Execution Authority
kind: concept
layer: 3
summary: >
  Definiert, wer Workflows ausführt, Zustände kontrolliert und deterministische Ausführung ermöglicht.
core_decision: >
  Wer ist die Ausführungsinstanz (Execution Authority), und wie wird deterministisches Verhalten sichergestellt?
tags: [architecture, structure]
links:
  - { rel: is_enabled_by, to: module_composition, strength: 0.6 }
  - { rel: requires, to: observability_design, strength: 0.6 }
  - { rel: is_covered_by, to: quality_gates, strength: 0.6 }
  - { rel: governs, to: execution, strength: 0.6 }
  - { rel: is_constrained_by, to: sandboxing_and_isolation, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- Eine klare Ausführungsautorität reduziert “heimliche Nebenläufe” und Race-Conditions.
- Determinismus: Inputs/Configs/Versions sind Teil des Runs (replaybar).
- Side-effects (IO) über Ports und eindeutig identifizierbar.

**Typische Failure-Modes**
- Mehrere “kleine Runner” → Zustandsdrift, schwer reproduzierbar.
- Side-effects ohne Tracking → Bugs nicht replaybar.
- Implizite globale Zustände → Testbarkeit bricht.
