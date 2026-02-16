# Spec-Driven Development – Strategie & Leitlinien

## 1. Grundidee

**Spec-Driven Development (SDD)** bedeutet:

- Spezifikationen beschreiben das System.
- Code implementiert die Spezifikationen.
- Code ist **niemals** selbst die Spezifikation.

Ziel ist **nicht Bürokratie**, sondern:

- Kontrolle über Komplexität
- klare Verantwortlichkeiten
- vorhersehbare Evolution
- geringe implizite Entscheidungen

---

## 2. Arten von Specs (abstrakt)

### 2.1 Architektur- & Gesetzes-Specs

**Zweck:**  
Systemweite, nicht verhandelbare Regeln.

**Beispiele:**

- Schichten / Boundaries
- wer darf was ausführen
- Abhängigkeitsregeln
- Test-Pflichten
- Observability-Pflichten

**Eigenschaften:**

- selten geändert
- stark normierend
- gelten für alle Komponenten

---

### 2.2 System- / Feature-Specs

**Zweck:**  
Verhalten und Struktur eines Systems oder Subsystems.

**Beschreiben:**

- Verantwortlichkeiten
- Lebenszyklen
- Zustandsmodelle
- Schnittstellen
- Invarianten

**Eigenschaften:**

- mittlere Änderungsfrequenz
- Grundlage für Implementierung & Tests
- erlauben parallele Arbeit

---

### 2.3 Komponenten- / Plugin- / Modul-Specs

**Zweck:**  
Austauschbare Bausteine präzise definieren.

**Beschreiben:**

- Identität
- Konfiguration
- Eingaben / Ausgaben
- Fehlerfälle
- Laufzeitverhalten

**Eigenschaften:**

- hoch granular
- isoliert testbar
- ermöglichen Erweiterbarkeit

---

## 3. Grundregel: Änderungen am Code nur über Specs

### 3.1 Die Regel

Jede **fachliche oder verhaltensrelevante** Codeänderung benötigt eine **Spec-Änderung**.

**Gilt für:**

- neue Features
- geänderte Semantik
- neue Optionen
- neue Fehlerfälle
- geänderte Defaults

**Gilt nicht für:**

- reine Refactorings
- Umbenennungen
- Formatierung
- Performance-Optimierungen **ohne** Semantikänderung

---

### 3.2 Warum diese Regel wichtig ist

**Ohne diese Regel:**

- Code wird implizite Wahrheit
- Wissen steckt in Köpfen oder Commit-History
- Agenten / Entwickler treffen stillschweigend Designentscheidungen

**Mit dieser Regel:**

- Architektur bleibt erklärbar
- Entscheidungen sind dokumentiert
- spätere Änderungen werden günstiger

---

## 4. MVP vs. Gesamtlösung – saubere Abgrenzung

### 4.1 Zentrale Klarstellung

> **MVP ist eine Implementierungsstrategie – keine Spezifikationsstrategie.**

- Specs sind vollständig.
- Implementierungen sind phasenweise.

---

### 4.2 Gegenüberstellung

| Aspekt | MVP-Implementierung | Gesamtlösung |
|------|---------------------|--------------|
| Spec-Umfang | vollständig | vollständig |
| Abgedeckte Use-Cases | minimaler End-to-End-Slice | alle |
| Fehlerfälle | wichtigste | vollständig |
| Skalierung | oft vereinfacht | vollständig |
| Ziel | Integrationsbeweis | Produktionsreife |

---

### 4.3 Zweck eines MVP-Slices

Ein MVP-Slice beweist:

- dass die Specs konsistent sind
- dass Schnittstellen richtig gewählt sind
- dass Architekturregeln praktikabel sind

Ein MVP ist **kein Prototyp**, sondern ein **kleinstes korrektes System**.

---

## 5. Warum man nicht „gleich alles“ implementiert

### 5.1 Technischer Grund

Komplexe Systeme bestehen aus Abhängigkeiten:

Contracts → Registry → Runtime → Storage → Orchestration

Alles gleichzeitig zu bauen:

- verschleiert Fehlerursachen
- erschwert Tests
- fördert Shortcut-Designs

---

### 5.2 Organisatorischer Grund

- parallele Arbeit wird schwer
- Reviews werden unklar
- Specs verlieren ihre Steuerungsfunktion

---

## 6. Empfohlene Arbeitsweise (abstrakt)

### Phase 1 – Contracts & Invarianten

- Interfaces
- Fehlercodes
- Datenmodelle
- **keine** konkrete Logik

### Phase 2 – Minimaler End-to-End Slice (MVP)

- ein klarer Use-Case
- vollständiger Durchstich
- einfache Implementierung

### Phase 3 – Ausbau zur Gesamtlösung

- Skalierung
- Persistenz
- Retry / Timeout
- Performance

> Specs ändern sich dabei kaum – nur die Implementierung wächst.

---

## 7. Rolle von Tests im Spec-Driven Development

Tests sind **keine Zusatzarbeit** und **keine Qualitätsoption**.  
Tests sind **ausführbare Specs**.

Jede Spec sollte implizit beantworten:

- was ist ein Erfolgspfad
- was ist ein Fehlerpfad
- was darf niemals passieren

---

## 8. Zusammenarbeit Mensch ↔ Agent / Team

### 8.1 Verantwortung des Menschen

- Specs formulieren
- Prioritäten setzen
- Alternativen abwägen
- Architekturentscheidungen treffen

### 8.2 Verantwortung des Agenten / Entwicklers

- Specs exakt umsetzen
- keine impliziten Annahmen treffen
- bei Unklarheiten zurückfragen
- Tests liefern

---

## 9. Alternativen zu Spec-Driven Development

- **Code-First:**  
  schneller Start, aber schwer skalierbar, implizit

- **API-First:**  
  gute externe Verträge, interne Architektur oft ungeklärt

- **Spec-Driven Development:**  
  kontrollierte Komplexität, langlebig, aber diszipliniert

---

## 10. Leitsatz

> **Specs sind nicht dazu da, Entwicklung zu bremsen.**  
> **Sie sind dazu da, spätere Entwicklung nicht zu blockieren.**