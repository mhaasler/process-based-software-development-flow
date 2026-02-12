---
id: shared_language_and_models
title: Gemeinsame Sprache & Modelle
kind: concept
layer: 3
summary: >
  Stellt sicher, dass Begriffe, Domänenmodelle und Metaphern konsistent sind – sonst reden KI und Menschen aneinander vorbei.
core_decision: >
  Welche Begriffe/Modelle sind verbindlich, und wie wird ihre Bedeutung stabil gehalten?
tags: [communication]
links:
  - { rel: enables, to: artifacts_and_truth_sources, strength: 0.6 }
  - { rel: reduces, to: ambiguity_and_alignment, strength: 0.6 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.2, max: 0.5 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Definiere zentrale Begriffe (Glossar/Domain Model) als Artefakte mit Git-History.
- Beispiele > Definitionen: „So sieht’s aus“ reduziert Interpretationsspielraum.
- KI sollte Begriffe *verwenden*, nicht neu erfinden (Policy/Contracts).

**Typische Failure-Modes**
- Begriffssalat → jeder meint was anderes, Specs werden unbrauchbar.
- Modelle nur in Köpfen → Onboarding und KI-Assists scheitern.
- Lokale Dialekte je Modul → Integration eskaliert.
