# Process-Based Software Development (PSE)

Ein spezifikationsgetriebener Knowledge Graph für Softwareentwicklungs-Prozesse.

---

## Was ist das?

Dieses Projekt modelliert architektonische Leitplanken und Prozesslogik in einer maschinenlesbaren Struktur:

- **Entscheidungsräume** & Architekturprinzipien
- **Prozesslogik** & Governance-Regeln
- **Sicherheitsgrenzen** & Agentenrollen

> **Wahrheit liegt in Markdown – nicht im UI.**

---

## Warum?

Mit zunehmender KI-Automatisierung verschiebt sich der Engpass von der Implementierung hin zur Gestaltung von Entscheidungs- und Ausführungsprozessen. Dieses System macht diese Struktur explizit, navigierbar und validierbar.

---

## Wie funktioniert es?

- **Nodes** (`knowledge/nodes/`) bilden den Graphen.
- **Galaxies** clustern verwandte Konzepte.
- **Build-Skript** erzeugt eine interaktive Visualisierung.
- **Gates** validieren Struktur und Konsistenz.

Alles im System ist **diffbar**, **versioniert** und **reviewbar**.

---

## Workflow

1. **Idee** → Inbox
2. **Kuratierung** → Graph
3. **Gate** → Validierung
4. **Review** → Merge

*KI kann den Prozess unterstützen, arbeitet aber ausschließlich über diffbare Artefakte.*

---

## Struktur

```text
knowledge/   # Graph (Source of Truth)
specs/       # Regeln & Policies
scripts/     # Gates & Orchestrator
ui/          # Visualisierung
```

---

## Nicht-Ziele

Dieses Projekt ist ausdrücklich **kein** Wiki, kein BPM-Tool und kein reines Chat-Archiv. Es ist ein **strukturiertes Entscheidungsnetz**.


Weitere Details findest du in der [README_LONG.md](README_LONG.md).