# Process-Based Software Development (PSE) - Knowledge Graph

Dieses Projekt implementiert einen **spezifikationsgetriebenen Knowledge Graph** für Softwareentwicklungs-Prozesse. Es dient dazu, architektonische Leitplanken, Patterns und Entscheidungen in einer maschinenlesbaren und visualisierbaren Form zu verwalten.

## 🚀 Was ist das?

Das Herzstück sind Markdown-Dateien in `knowledge/nodes/`, die über Frontmatter-Verknüpfungen einen Graphen bilden.
- **Entitäten**: Nodes (Konzepte/Tools), Galaxies (Cluster) und Gradients (Metriken).
- **Automatisierung**: Ein Build-Skript (`build.mjs`) generiert daraus eine `graph.json` und statische Assets für ein interaktives UI.
- **Gatekeeper**: Skripte validieren die Datenintegrität (keine toten Links, Pflichtfelder vorhanden).

## 🛠 Starten & Lokale Entwicklung

### Voraussetzungen
- Node.js (v18+)
- npm

### Installation
```bash
npm install
```

### Build & Validierung
Um den Graphen zu validieren und das UI-Bundle in `dist/` zu erzeugen:
```bash
./scripts/knowledge_gate.sh
```

### UI betrachten
Nach dem Build kannst du die `dist/index.html` einfach in einem Browser öffnen oder über einen einfachen HTTP-Server hosten:
```bash
npx serve dist
```

## 📥 Sachen "einkippen" (Workflow)

Neue Ideen oder Erkenntnisse fließen über einen strukturierten **Inbox-Prozess** in den Graphen ein.

### 1. Idee hinzufügen (Schnellschuss)
Nutze das `inbox_add.sh` Skript, um schnell eine Notiz zu hinterlegen:
```bash
./scripts/inbox_add.sh "Titel der Idee" "Hier steht der restliche Text..."
```
Dies erstellt eine Datei in `knowledge/inbox/YYYY-MM-DD_HH-MM-SS.md`.

### 2. Kuratierung (Inbox -> Graph)
Um die Inbox-Elemente in den offiziellen Knowledge Graph zu überführen:

1. **Bundle erstellen**:
   ```bash
   ./scripts/curate_apply.sh --new
   ```
   Dies erstellt einen Ordner unter `knowledge/inbox/_bundle/`.

2. **KI-Unterstützung**:
   - Gehe in den neuen Bundle-Ordner und öffne `PROMPT.md`.
   - Kopiere den Inhalt in eine KI (z.B. ChatGPT oder Copilot).
   - Kopiere die Antwort der KI (den Diff) in die Datei `AI_OUTPUT.md` im Bundle-Ordner.

3. **Änderungen anwenden**:
   ```bash
   ./scripts/curate_apply.sh --apply knowledge/inbox/_bundle/<name> --move-done
   ```
   Das Skript extrahiert den Diff, validiert die Änderungen und verschiebt die fertigen Inbox-Items nach `_done`.

## 📂 Struktur
- `knowledge/nodes/`: Die eigentliche Source of Truth (Markdown).
- `knowledge/galaxies/`: Logische Gruppierungen der Nodes.
- `knowledge/inbox/`: Zwischenlager für neue Ideen.
- `ui/`: Quelldateien für das Visualisierungs-Interface.
- `dist/`: Generierte Artefakte (nicht im Git).
- `scripts/`: Hilfsskripte für Validierung, Build und Kuration.
