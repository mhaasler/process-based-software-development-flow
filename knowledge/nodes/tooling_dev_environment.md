---
id: tooling_dev_environment
title: Tooling & Dev-Environment
kind: core
layer: 2
summary: >
  Das Dev-Environment ist ein Betriebssystem: Toolchain, Reproduzierbarkeit, Automatisierung und sichere Ausführung.
core_decision: >
  Welche Tools/Standards sind verbindlich, damit Entwicklung schnell, reproduzierbar und sicher bleibt – auch mit KI?
tags: [core, tooling]
links:
  - { rel: expands_to, to: local_dev_environment, strength: 0.6 }
  - { rel: expands_to, to: automation_and_scripts, strength: 0.6 }
  - { rel: expands_to, to: ai_assisted_workflow, strength: 0.6 }
gradients:
  explicitness: { min: 0.6, max: 0.9 }
  communication_intensity: { min: 0.3, max: 0.6 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.7, max: 1.0 }
---
**Leitplanken**
- Tooling ist Teil der Architektur: es steuert Qualität, Geschwindigkeit und Sicherheit.
- Reproduzierbarkeit > “läuft bei mir”.
- KI-Tools brauchen klare Grenzen (Sandbox, Truth Sources, Gates).

**Typische Failure-Modes**
- Tooling driftet pro Person → Debugging/Onboarding eskaliert.
- Keine Gates → Qualität wird Zufall.
- KI kann alles ausführen → Sicherheitsrisiko.
