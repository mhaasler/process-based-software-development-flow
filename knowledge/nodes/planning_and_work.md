---
id: planning_and_work
title: Planung & Arbeitspakete
kind: concept
layer: 3
summary: >
  Schneidet Spezifikationen in kleine, überprüfbare Schritte und minimiert Risiko durch frühes Feedback.
core_decision: >
  Wie wird Arbeit so geschnitten, dass Feedback früh kommt und Abhängigkeiten sichtbar bleiben?
tags: [process, seed]
links:
  - { rel: is_decomposed_from, to: specification, strength: 0.8 }
  - { rel: schedules, to: execution, strength: 0.8 }
  - { rel: is_adjusted_by, to: review_and_quality, strength: 0.6 }
  - { rel: respects, to: module_composition, strength: 0.6 }
gradients:
  explicitness: { min: 0.5, max: 0.8 }
  communication_intensity: { min: 0.5, max: 0.8 }
  automatable: { min: 0.3, max: 0.6 }
  stability: { min: 0.4, max: 0.7 }
  centrality: { min: 0.6, max: 0.8 }
---
**Leitplanken**
- Ein Arbeitspaket ist erst „klein genug“, wenn es in <1–2 Sessions reviewbar/testbar ist.
- Plane nach *Risiko* (Unklarheit, Abhängigkeiten), nicht nach „ist halt der nächste Schritt“.
- Definiere pro Schritt ein konkretes „Proof“-Artefakt (Test, Demo, Signal, Diff).

**Typische Failure-Modes**
- Pakete sind „zu groß“ → Reviews werden oberflächlich, CI/Tests werden umgangen.
- Reihenfolge ignoriert Abhängigkeiten → später teure Rework-Schleifen.
- Kein klarer Proof → Fortschritt ist nur Aktivität, nicht Ergebnis.
