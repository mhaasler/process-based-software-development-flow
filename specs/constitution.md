# AI-Centric Knowledge Operating System (Constitution)

**Version: 1.0 – Baseline**

---

## 1. Präambel

Dieses System ist ein strukturbildendes Betriebssystem für Softwareentwicklung im KI-Zeitalter. Es modelliert nicht Code, sondern Entscheidungen, Regeln, Prozesse und deren Wechselwirkungen.

Mit zunehmender KI-Automatisierung verschiebt sich der Engpass von der Implementierung hin zur Gestaltung von Entscheidungs- und Ausführungsarchitektur.

Diese Constitution definiert die unverhandelbaren Regeln dieses Systems.

---

## 2. Ziel & Scope

Dieses System dient als:
- Denkmodell für Strategie
- Internes Transformationstool
- Operatives Dev-Betriebssystem
- Wissensnetz für Struktur-, Prozess- und Regelentscheidungen

> Es ersetzt kein Projektmanagement-Tool, Wiki oder klassische Architektur-Dokumentation. **Es strukturiert sie.**

---

## 3. Grundprinzipien

### 3.1 Artefakt vor Gespräch
Wahrheit entsteht durch diffbare Artefakte, Review und Merge. Nicht durch Meetings oder Chatverläufe.

---

### 3.2 Struktur vor Geschwindigkeit
Geschwindigkeit ohne Struktur erzeugt Drift. Struktur ermöglicht nachhaltige Beschleunigung.

---

### 3.3 Minimalität
- Nodes sind klein.
- Links sind tragend.
- Texte sind präzise.
- Keine Redundanz.

---

### 3.4 Versionierbarkeit
Alles, was als Wahrheit gilt, ist in Markdown/YAML, versioniert, diffbar und reviewbar.

---

### 3.5 Layer-Disziplin
Das System ist geschichtet:
- **Layer 0**: Core-Struktur- & Regelentscheidungen
- **Layer 1**: Governance / Prozess / Kommunikation
- **Layer 2**: Subsysteme (Security, Tooling, Observation, …)
- **Layer 3**: Detailkonzepte

Layer dürfen nicht beliebig vermischt werden.

---

## 4. Architektur des Wissenssystems

Das Root-Verzeichnis enthält:
- `knowledge/nodes/` (Pures Wissen)
- `knowledge/galaxies/` (Strukturierung)
- `knowledge/inbox/` (Entwürfe)
- `dist/` (Output)

---

### 4.1 Node (atomare Einheit)
Eine Node enthält ID, Title, Kind, Layer, Summary, Core Decision, Tags, Links, Gradients sowie Leitplanken und Failure-Modes. Nodes sind klein, fokussiert und unabhängig versionierbar.

---

### 4.2 Galaxy (Subsystem)
Eine Galaxy gruppiert Nodes, definiert Gradient-Dimensionen und erlaubt Drill-Downs. Galaxien sind Subsysteme des Betriebssystems.

---

### 4.3 Links
Links sind gerichtet, semantisch benannt und gewichtet (0–1). Ziel ist keine Vollvernetzung, sondern nur strukturell tragende Beziehungen.

---

### 4.4 Gradients
Nodes bewegen sich entlang von Dimensionen (*explicitness*, *automatable*, *stability*, etc.). Gradienten sind keine Labels, sondern Spannungsachsen.

---

## 5. Hauptsysteme

### 5.1 Struktur- & Regelentscheidungen (Core)
Welche Strukturen und Regeln gelten – und wie bleiben sie veränderbar, ohne beliebig zu werden? Enthält ADRs, Policies und Prozessregeln.

---

### 5.2 Prozess
Wie entstehen, wirken und verändern sich Entscheidungen? (Framing → Spec → Planung → Ausführung → Review → Feedback).

---

### 5.3 Kommunikation
Wie wird Wissen zwischen Mensch, System und KI übertragen? (Shared Language, Truth Sources, Alignment).

---

### 5.4 Beobachtung & Transparenz
Wie wird Verhalten sichtbar und steuerbar? (Signals, SLOs, Telemetrie, Runbooks).

---

### 5.5 Security & Safety
Welche Regeln sind nicht verhandelbar? (Secrets, Least Privilege, Sandboxing, Supply Chain).

---

### 5.6 Tooling & Dev-Environment
Wie wird Entwicklung reproduzierbar, sicher und KI-fähig? (Local Dev, Automation/Gates, Knowledge Ops).

---

## 6. Operativer Workflow

### 6.1 Inbox → Curation
1. Rohidee in `knowledge/inbox`.
2. Erzeugen einer neuen Node oder Erweiterung bestehender Nodes.
3. Links ergänzen, Gate ausführen, Review.

> Inbox ist Material, nicht Wahrheit.

---

### 6.2 Knowledge Gate
Jede Änderung muss durch `node build.mjs` und die Validierung. Keine kaputten Links, keine impliziten Wahrheiten.

---

## 7. Rolle der KI

KI darf Nodes generieren, Links vorschlagen und Texte refaktorieren. Sie darf jedoch keine Wahrheit ohne Diff überschreiben, Regeln umgehen oder Security-Policies ignorieren.

**Wahrheit entsteht durch Gate + Review.**

---

## 8. Governance-Prinzip
Entscheidungen sind dokumentiert (ADR), verlinkt und revidierbar. Unklare Ownership ist nicht erlaubt.

---

## 9. Security-Prinzip
Security ist Default-Deny, Policy-getrieben und automatisiert. Secrets gehören niemals in Git, Logs oder Chats.

---

## 10. Observability-Prinzip
Feedback-Schleife: Signals → Runbooks → Incident → Postmortem → Change → Spec Update. Keine Beobachtung ohne Konsequenz.

---

## 11. Tooling-Prinzip
Tooling ist Teil der Architektur. Regeln werden als Skripte, Gates und Templates kodiert – nicht als bloße Empfehlungen.

---

## 12. Evolutionsmodell
Das System wächst durch Inbox-Einträge, kuratierte Nodes und strukturierte Links – nicht durch spontane Textakkumulation.

---

## 13. Risiken
Overlinking, Wikiisierung, KI-Drift, Layer-Verwischung, Inbox-Müll.

---

## 14. Nicht-Ziele
Kein BPM-Tool, kein klassisches Wiki, keine reine Diagramm-Sammlung. Es ist ein Entscheidungsnetz.

---

## 15. Leitthese

Softwarequalität im KI-Zeitalter entsteht nicht durch bessere Implementierung, sondern durch bessere Entscheidungsarchitektur.
