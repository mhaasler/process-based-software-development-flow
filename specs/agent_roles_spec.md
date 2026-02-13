# AI Agent Roles & Orchestration Specification

**Version 1.0 – Baseline**

---

## 1. Zweck

Diese Spezifikation definiert:
- Welche Agenten existieren
- Welche Verantwortung sie tragen
- Welche Artefakte sie erzeugen dürfen
- Welche Grenzen sie haben
- Wie sie orchestriert werden
- Welche Gates sie passieren müssen

**Ziel:** KI-Agenten beschleunigen strukturiert – ohne Architektur, Sicherheit oder Wahrheit zu destabilisieren.

---

## 2. Grundprinzip

**Agenten sind:**
- Spezialisierte Rollen
- Mit begrenztem Kontext
- Mit klarer Artefaktverantwortung
- Mit definierten Outputs

**Agenten sind nicht:**
- Autonome Entscheider
- Policy-Override-Mechanismen
- Architektur-Autoren ohne Review

---

## 3. Agent-Typen (Systemübersicht)

Das System unterscheidet folgende Agentenrollen:

1. **Spec Agent**
2. **Curator Agent**
3. **Architecture Agent**
4. **Implementation Agent**
5. **Review Agent**
6. **Security Agent**
7. **Observability Agent**
8. **Refactor Agent**
9. **Governance Agent**
10. **Orchestrator (Meta-Agent)**

> Nicht jeder Agent muss technisch getrennt laufen. Aber die Rollen sind logisch strikt getrennt.

---

## 4. Rollen im Detail

### 4.1 Spec Agent

**Zweck:** Formuliert Spezifikationen aus Anforderungen.

**Darf:**
- Neue Spec-Dateien erstellen
- Bestehende Specs erweitern
- Requirements strukturieren
- Invarianten formulieren

**Darf nicht:**
- Architekturentscheidungen ohne ADR treffen
- Code ändern
- Security-Policies anpassen

**Output:**
- `.md` Spezifikationen
- Diff

---

### 4.2 Curator Agent

**Zweck:** Strukturiert Wissen im Knowledge Graph.

**Darf:**
- Nodes erzeugen
- Links ergänzen
- Galaxien anpassen
- Gradienten vorschlagen

**Darf nicht:**
- Bestehende Wahrheit überschreiben ohne Diff
- Policy-Abschnitte entfernen
- Layer verletzen

**Output:**
- `knowledge/nodes/*.md`
- `knowledge/galaxies/*.yml`
- Diff

---

### 4.3 Architecture Agent

**Zweck:** Bewertet strukturelle Auswirkungen.

**Darf:**
- Boundary-Vorschläge machen
- Contract-Änderungen vorschlagen
- ADR-Entwürfe erstellen

**Darf nicht:**
- Implementieren
- Gates umgehen
- Policies ändern

**Output:**
- ADR-Draft
- Architektur-Diff

---

### 4.4 Implementation Agent

**Zweck:** Erzeugt Code gemäß Spec.

**Darf:**
- Code generieren
- Tests generieren
- Refactorings vorschlagen

**Darf nicht:**
- Spec ändern
- Architektur anpassen
- Sicherheitsregeln umgehen

**Output:**
- Code-Diff
- Test-Diff

---

### 4.5 Review Agent

**Zweck:** Analysiert Artefakte.

**Darf:**
- Inkonsistenzen aufzeigen
- Boundary-Verletzungen melden
- Gate-Verstöße identifizieren
- Verbesserungsvorschläge machen

**Darf nicht:**
- Selbstständig mergen
- Regeln ändern

---

### 4.6 Security Agent

**Zweck:** Prüft Security-Implikationen.

**Prüft:**
- Secret-Leaks
- Sandbox-Verletzungen
- Supply-Chain-Risiken
- Access-Violations

**Darf nicht:**
- Security-Policy ändern
- Ausnahme genehmigen

---

### 4.7 Observability Agent

**Zweck:** Stellt sicher, dass Änderungen messbar sind.

**Prüft:**
- Telemetrie vorhanden?
- Runbooks aktualisiert?
- SLO betroffen?

---

### 4.8 Refactor Agent

**Zweck:** Reduziert Komplexität ohne Verhaltensänderung.

**Regeln:**
- Keine Semantik ändern
- Keine Spec ändern
- Nur Struktur

---

### 4.9 Governance Agent

**Zweck:** Prüft Regelverletzungen.

**Prüft:**
- Layer-Disziplin
- Policy-Konformität
- Ownership-Klarheit

---

### 4.10 Orchestrator Agent

**Zweck:** Steuert Workflow.

**Aufgabe:**
- Reihenfolge bestimmen
- Agenten koordinieren
- Eskalation triggern
- Gate auslösen

> Der Orchestrator darf keine inhaltlichen Änderungen erzeugen.

---

## 5. Agent Interaction Model

**Standardfluss:**
Input → Spec Agent → Architecture Agent → Implementation Agent → Review Agent → Security Agent → Observability Agent → Gate → Merge

> Nicht jede Änderung durchläuft alle Agenten.

---

## 6. Kontextprinzip

Jeder Agent erhält:
- Nur relevanten Kontext
- Versionierte Artefakte
- Keine impliziten Annahmen

> Kontext ist explizit.

---

## 7. Gate-Regel

Kein Agent darf:
- Direkt mergen
- Gate überspringen
- Policies umgehen

**Gate** = Technisches und strukturelles Sicherheitsnetz.

---

## 8. Eskalationsregel

Wenn Agent:
- Architektur verändert
- Policy betrifft
- Security berührt
- Core Layer betrifft

**→ ADR + menschlicher Review erforderlich**

---

## 9. Drift-Kontrolle

Agenten dürfen nicht:
- Layer mischen
- Implizite Regeln erfinden
- Zentrale Nodes umbenennen
- Gradienten verändern ohne Kontext

---

## 10. Erweiterbarkeit

Neue Agenten müssen:
- Rolle definieren
- Scope definieren
- Output definieren
- Grenzen definieren
- Gate-Anbindung definieren

---

## 11. Anti-Pattern

- ❌ „Super-Agent“, der alles darf
- ❌ Agent ohne Gate
- ❌ Agent mit Secrets
- ❌ Agent ohne Diff
- ❌ Agent mit implizitem Kontext

---

## 12. Leitthese

Agenten sind Werkzeuge.
Struktur ist das System.
Governance ist die Grenze.
Wahrheit entsteht durch Review + Gate.
