---
id: architecture_boundaries
title: Boundaries & Verantwortlichkeiten
kind: concept
layer: 3
summary: >
  Definiert, welche Teile des Systems wofür zuständig sind – und welche Abhängigkeiten verboten sind.
core_decision: >
  Wo liegen die Boundaries, und welche Abhängigkeiten sind zulässig, damit Evolution kontrollierbar bleibt?
tags: [architecture, structure]
links:
  - { rel: constrains, to: interfaces_and_contracts, strength: 0.8 }
  - { rel: constrains, to: change_control, strength: 0.7 }
  - { rel: is_observed_by, to: observability_design, strength: 0.5 }
  - { rel: is_informed_by, to: problem_framing, strength: 0.5 }
gradients:
  explicitness: { min: 0.7, max: 0.95 }
  communication_intensity: { min: 0.4, max: 0.7 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.6, max: 0.9 }
  centrality: { min: 0.8, max: 1.0 }
---
**Leitplanken**
- Boundaries sind *Entscheidungen*: Ownership, Datenfluss, Zustandsgrenzen.
- „Verbotene Abhängigkeiten“ explizit machen (Ports/Facades/Contracts).
- Boundary-Entscheidungen müssen test-/lintbar sein (Gates).

**Typische Failure-Modes**
- Boundaries nur als Diagramm → im Code schleicht sich alles wieder zusammen.
- Ownership unklar → jedes Problem wird “global”.
- Grenzen werden pro Feature neu interpretiert → Architektur driftet.
