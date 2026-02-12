---
id: knowledge_ops_inbox_and_curation
title: Knowledge Ops (Inbox → Curation)
kind: concept
layer: 3
summary: >
  Operationalisiert Teamwissen: rohe Ideen rein, kuratierte Nodes/Links raus – via Diff, Review und Gates.
core_decision: >
  Wie werden Ideen schnell erfasst, aber strukturiert in “Wahrheit” überführt, ohne dass das System vermüllt?
tags: [tooling, knowledge, process]
links:
  - { rel: depends_on, to: artifacts_and_truth_sources, strength: 0.5 }
  - { rel: is_guarded_by, to: quality_gates, strength: 0.4 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Inbox ist roh und schnell; Curation ist strukturiert und reviewbar.
- KI kuratiert als Diff (Nodes/Links/Galaxies), nicht als “Rewrite”.
- Knowledge-Gate verhindert Broken Links und Drift.

**Typische Failure-Modes**
- Alles wird sofort “Wahrheit” → Chaos.
- Inbox bleibt liegen → Wissen verschwindet wieder.
- KI schreibt ungeprüft um → Autorität bricht.
