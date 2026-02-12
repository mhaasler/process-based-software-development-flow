---
id: ai_assisted_workflow
title: KI-gestützter Workflow (Copilot/Agents)
kind: concept
layer: 3
summary: >
  Definiert, wie KI arbeitet: Kontext, Rollen, Grenzen, Review-Mechanik und wie Ergebnisse in Artefakte überführt werden.
core_decision: >
  Welche Aufgaben delegieren wir an KI, und welche Regeln/Gates verhindern Drift, Halluzinationen und Security-Risiken?
tags: [tooling, ai, process]
links:
  - { rel: requires, to: artifacts_and_truth_sources, strength: 0.5 }
  - { rel: requires, to: sandboxing_and_isolation, strength: 0.5 }
  - { rel: is_guarded_by, to: quality_gates, strength: 0.5 }
  - { rel: depends_on, to: artifacts_and_truth_sources, strength: 0.6 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.3, max: 0.6 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- KI liefert Diffs/Artefakte, nicht “nur Text”.
- Kontext ist versioniert (Specs/Policies), nicht im Prompt versteckt.
- Review: KI-Ergebnis ist Vorschlag, Wahrheit entsteht durch Gate + Merge.

**Typische Failure-Modes**
- KI ändert “Wahrheit” ohne Diff → Drift.
- Zu viel Freiheit (Netz/FS/Secrets) → Security-GAU.
- KI produziert Output ohne Vertrauensmodell → Team ignoriert es.
