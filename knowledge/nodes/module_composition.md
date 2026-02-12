---
id: module_composition
title: Module & Composition Root
kind: concept
layer: 3
summary: >
  Legt fest, wie Module gebaut, verbunden und zur Laufzeit zusammengesetzt werden (Composition Root).
core_decision: >
  Wo wird zusammengesetzt (Composition Root), und welche Abhängigkeiten dürfen Module direkt haben?
tags: [architecture, structure]
links:
  - { rel: is_enabled_by, to: interfaces_and_contracts, strength: 0.7 }
  - { rel: depends_on, to: runtime_execution_authority, strength: 0.6 }
  - { rel: is_enforced_by, to: quality_gates, strength: 0.7 }
  - { rel: is_informed_by, to: planning_and_work, strength: 0.5 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.5, max: 0.8 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.7, max: 0.95 }
---
**Leitplanken**
- Module sind austauschbar nur, wenn Abhängigkeiten *gerichtet* sind (Ports/Facades).
- Composition Root ist der einzige Ort, der “alles kennen darf”.
- Autonomie heißt: Modul kann isoliert getestet werden (Mock Ports).

**Typische Failure-Modes**
- “Nur kurz” direkte Imports → Facade-Regeln erodieren.
- Composition verteilt sich → Debugging wird unmöglich.
- Module sind nicht isoliert testbar → Qualität hängt am Gesamtbuild.
