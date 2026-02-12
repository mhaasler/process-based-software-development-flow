---
id: local_dev_environment
title: Lokales Dev-Environment (Setup & Parität)
kind: concept
layer: 3
summary: >
  Definiert Setup, Containerisierung und Parität zu CI/Prod – damit Verhalten reproduzierbar bleibt.
core_decision: >
  Wie nahe muss lokal an CI/Prod sein – und wo akzeptieren wir bewusste Abweichungen?
tags: [tooling, operations]
links:
  - { rel: supports, to: reproducible_builds, strength: 0.6 }
  - { rel: is_supported_by, to: automation_and_scripts, strength: 0.5 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.5, max: 0.85 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- “One command to start” (oder wenige) – Setup ist ein Produkt.
- Parität bewusst: welche Unterschiede sind ok (z.B. Debug, Volumes)?
- Dokumentiere *nur* das Minimum, der Rest ist Automatisierung.

**Typische Failure-Modes**
- Setup-Drift → jeder hat “sein” System.
- Lokale Sonderpfade → Bugs nicht reproduzierbar.
- Onboarding dauert Tage → Team verliert Tempo.
