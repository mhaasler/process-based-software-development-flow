

# Wie sich Entwicklungsprozesse ändern müssen, um KI sinnvoll zu nutzen

---

## 1. Grundthese (zentrale Leitfolie)
> 
KI darf nicht primär nur als Ergänzung bestehender Workflows verstanden werden. Vielmehr sollte sie als strukturbildendes Element dienen: Die Entwicklungsprozesse von Anfang an so zu entwerfen, dass Künstliche Intelligenz das Fundament bildet – und Architektur, Abläufe und Dokumentation konsequent darum herum entstehen.

Viele heutige Prozesse sind optimiert für:

* menschliche Kommunikation
* implizites Wissen
* soziale Abstimmung

KI braucht dagegen:

* explizite Artefakte
* klare Verantwortlichkeiten
* maschinenlesbare Entscheidungen

➡️ **Das zwingt zu Prozessänderungen.**

---

## 2. Implizit → Explizit (der große Shift)

### Klassische Entwicklung

* Architektur „entsteht“
* Regeln sind Konventionen
* Wissen lebt in Köpfen
* Doku ist erklärend, nicht normativ

### KI-taugliche Entwicklung

* Architektur wird **formuliert**
* Regeln sind **geschrieben**
* Wissen ist **versioniert**
* Artefakte sind **bindend**

**Merksatz:**

> *Alles, was nicht explizit ist, existiert für KI nicht.*

---

## 3. Confluence: von „Wissensablage“ zu Kontextschicht

### Heute (typisch)

* lange Seiten
* Vermischung von:

  * Erklärung
  * Entscheidung
  * Spezifikation
* hoher Drift

### KI-fähiger Prozess

* **Confluence verliert Normativität**
* neue Rolle:

  * Kontext
  * Motivation
  * Entscheidungsbegründung

**Klarer Schnitt:**

* *Was* das System tut → Git (Specs)
* *Warum* → Confluence

➡️ Confluence bleibt wichtig – aber **anders**.

---

## 4. Scrum: von Sprint-Output zu Entwurfs-Iteration

### Klassisches Scrum

* User Stories
* Story Points
* Velocity (Arbeitsleistung Metrik)
* Fokus: Output

### KI-angepasstes Agil

* Use-Case-Specs
* Entwurfsvarianten
* MVP-Definitionen
* Fokus: **Entscheidungen**

**Neuer Sprint-Zweck:**

> *Nicht Code liefern – sondern Verhalten entscheiden.*

---

## 5. MVP neu gedacht

### Klassisches MVP

* Feature-reduziert
* oft technisch unklar
* viel implizite Annahme

### KI-fähiges MVP

* **Verhaltens-MVP**
* klarer Scope
* explizite Regeln

Beispiel:

* nicht: „Checkout light“
* sondern:
  „Checkout nur Happy Path, keine Fehlerbehandlung“

➡️ Perfekt für KI-Generierung.

---

## 6. Jira: von Feature-Tracking zu Entscheidungs-Tracking

### Heute

* Tickets = Mini-Spezifikationen
* viel Text
* wenig Struktur

### KI-fähiger Prozess

#### Jira trackt:

  * Spec-Änderungen
  * Entwurfsentscheidungen
  * Varianten

**Regel:**

> *Kein Ticket ohne referenzierte Spec.*

➡️ Jira steuert Arbeit, nicht Inhalt.

#### Jira verwaltet

 * Spec nur noch im Git
 * Jira nur User Stories
 * 

---

## 7. Code Review: der kritischste Wandel

### Klassisches Code Review

* Stil
* Patterns
* persönliche Präferenzen
* Diskussion auf Implementierungsebene

### KI-fähiges Review

* **Spec-Review > Code-Review**
* Fragen sind:

  * Entspricht der Code der Spec?
  * Gibt es Abweichungen?
  * Ist Verhalten korrekt?

**Provokante Aussage (funktioniert gut im Vortrag):**

> *Code Reviews ohne Specs sind Meinungen, keine Qualitätssicherung.*

---

## 8. Neue Review-Hierarchie

### Empfohlene Reihenfolge

1. Spec Review (Architektur & Verhalten)
2. KI-Generierung
3. Abweichungsprüfung
4. Minimaler Code Review

➡️ Menschen reviewen **Entscheidungen**, nicht Tippfehler.

---

## 9. Tests: von Implementierungsprüfung zu Verhaltensschutz

### Klassisch

* Unit-Tests
* Whitebox
* fragil bei Refactoring

### KI-fähiger Ansatz

* Command- & Use-Case-Tests
* Blackbox
* aus Specs abgeleitet

**Wichtig:**

> Tests sichern Architektur, nicht Code.

---

## 10. CI/CD: vom Delivery-Fließband zur Entscheidungsmaschine

### Klassisch

* Build → Test → Deploy

### KI-fähige Pipeline

* Spec validieren
* Varianten generieren
* Previews erzeugen
* Feedback einsammeln

➡️ Pipeline wird **Entwurfsinstrument**

---

## 11. Neue Rollen (implizit entstehen sie sowieso)

| Rolle           | Fokus                  |
| --------------- | ---------------------- |
| Spec Owner      | Verhalten & Regeln     |
| AI Orchestrator | Agenten & Skills       |
| Reviewer        | Abweichungen & Risiken |
| Dev             | Integration & Kontext  |

➡️ Titel egal – **Aufgaben ändern sich**.

---

## 12. Typische Widerstände (und warum sie kommen)

### „Das ist zu viel Overhead“

* stimmt **kurzfristig**
* spart **langfristig massiv**

### „Wir sind agil, wir brauchen das nicht“

* Agil ohne explizite Artefakte funktioniert **nur mit Menschen**

### „KI macht das schon“

* KI verstärkt schlechte Prozesse brutal

---

## 13. Sehr klare Zusammenfassung (Slide-tauglich)

* KI braucht explizite Prozesse
* Specs schlagen Doku
* Entscheidungen schlagen Code
* Reviews verschieben sich nach vorne
* CI/CD wird Design-Werkzeug

---

## 14. Starke Abschlussfrage (Diskussion garantiert)

> *„Welche Teile eures Entwicklungsprozesses
> leben heute ausschließlich von implizitem Wissen?“*

