---
id: sandboxing_and_isolation
title: Sandboxing & Isolation
kind: concept
layer: 3
summary: >
  Trennt riskante Ausführung (Code, Tools, Imports) in isolierte Umgebungen mit klaren Grenzen und minimalen Rechten.
core_decision: >
  Welche Ausführungen müssen isoliert sein, und welche Limits (FS/Netz/CPU) sind verpflichtend?
tags: [security, architecture]
links:
  - { rel: constrains, to: runtime_execution_authority, strength: 0.5 }
  - { rel: reduces, to: supply_chain_security, strength: 0.4 }
gradients:
  explicitness: { min: 0.5, max: 0.85 }
  communication_intensity: { min: 0.2, max: 0.5 }
  automatable: { min: 0.6, max: 0.9 }
  stability: { min: 0.5, max: 0.8 }
  centrality: { min: 0.6, max: 0.9 }
---
**Leitplanken**
- Default: deny (Netz/FS/Secrets) – explizite Allowlists.
- Reproduzierbare Sandbox-Profile (limits, mounts, network policy).
- Alles, was KI „ausführt“, läuft nicht in der gleichen Trust-Zone wie Produktivsysteme.

**Typische Failure-Modes**
- „Nur lokal“ ohne Isolation → später wird es produktiv und gefährlich.
- Zu offene Netze/Volumes → Datenabfluss.
- Keine Limits → DoS durch unbounded tasks.
