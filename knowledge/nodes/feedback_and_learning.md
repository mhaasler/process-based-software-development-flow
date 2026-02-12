---
id: feedback_and_learning
title: Feedback & Lernen
kind: concept
layer: 3
summary: >
  Betriebssignale, Incidents und Nutzungserkenntnisse fließen zurück in Anforderungen, Specs, Regeln und Struktur.
core_decision: >
  Wie wird aus Beobachtung eine kontrollierte Änderung (Spec/Policy/Architektur) statt ad-hoc Hotfixing?
tags: [process, seed]
links:
  - { rel: is_yielded_by, to: review_and_quality, strength: 0.7 }
  - { rel: reframes, to: problem_framing, strength: 0.7 }
  - { rel: updates, to: requirements, strength: 0.6 }
  - { rel: is_enabled_by, to: observability_design, strength: 0.6 }
  - { rel: drives, to: change_control, strength: 0.6 }
  - { rel: uses, to: signals_and_slos, strength: 0.4 }
gradients:
  explicitness: { min: 0.4, max: 0.7 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.4, max: 0.7 }
  stability: { min: 0.3, max: 0.6 }
  centrality: { min: 0.6, max: 0.8 }
---
**Leitplanken**
- Feedback wird in Änderungen übersetzt: Spec-Change > Code-Hotfix (so oft wie möglich).
- Definiere Signale: Welche Events/Metriken/Traces beweisen (un)erwünschtes Verhalten?
- Lerne systematisch: Postmortems erzeugen Regeln/Checks, nicht nur „Lessons Learned“.

**Typische Failure-Modes**
- Feedback bleibt „Dashboard-Wissen“ → keine Änderungen, nur Beobachtung.
- Incidents erzeugen schnelle Fixes → langfristig Drift und technische Unsicherheit.
- Fehlende Kausalität → man misst viel, versteht wenig, optimiert falsch.
