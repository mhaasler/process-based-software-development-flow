# SpecKit vs. BMAD im Brownfield

Brownfield + kontinuierliche Feature-Entwicklung + Bugfixing ist ein sehr klarer Kontext.
Hier ist die präzise Einordnung: SpecKit vs. BMAD genau für diesen Fall, ohne Marketing-Gerede.

## Kurzentscheidung (vorweg)

Für Brownfield mit laufenden Fixes & Features ist SpecKit klar überlegen.
BMAD ist dafür strukturell zu schwer.

Nicht „weil BMAD schlecht ist“, sondern weil es gegen die Dynamik von Brownfield arbeitet.

## 1) Brownfield-Realität vs. Tool-Annahmen

Brownfield heißt konkret:

- bestehender Code + implizite Architektur
- Legacy-Ecken, Inkonsistenzen
- kleine Features, Refactors, Bugfixes
- Entscheidungen sind lokal, nicht systemweit
- Specs müssen schnell entstehen & schnell veralten dürfen

## 2) SpecKit im Brownfield

### Warum SpecKit passt

SpecKit ist inkrementell gedacht.

Typischer Ablauf bei dir:

Bug / Feature → Mini-Spec → klare Annahmen → gezielte Änderung → done

Eigenschaften im Brownfield:

- Specs sind feature-lokal
- Keine Annahme eines „sauberen Systems“
- Du kannst Specs:
  - verwerfen
  - zusammenfalten
  - später erweitern
- Perfekt für:
  - „Fix dieses Verhalten, aber brech X nicht“
  - „Feature Y unter existierenden Constraints“

Typische SpecKit-Artefakte (Brownfield-tauglich):

- `spec.md` → Was soll sich ändern?
- `constraints.md` → Was darf **nicht** kaputtgehen?
- `tasks.md` → Minimaler Umsetzungsplan

➡ Kein Rollenspiel, kein Übergabe-Theater.

## 3) BMAD im Brownfield (problematisch)

### Wo BMAD kollidiert

BMAD simuliert ein ideales Produktteam:

- Product Owner
- Business Analyst
- Architect
- Developer
- QA

👉 Brownfield hat das alles schon „im Code eingefroren“.

Konkrete Reibung:

- Jeder Bugfix wird zu:
  - Analyse-Phase
  - Architektur-Phase
  - Dev-Phase
  - QA-Phase
- Viel Dokumentation für:
  - Entscheidungen, die bereits gefallen sind
  - Architektur, die du nicht ändern darfst

➡ Das erzeugt:

- Overhead
- Token-Verschwendung
- Frustration

BMAD ist stark, wenn:

- Neues System
- Neues Produkt
- Große, geplante Epics

Nicht bei:

- „Dieser Codepfad macht bei Edge-Case Z Mist“
- „Feature X braucht nur eine kleine Erweiterung“

## 4) Entscheidender Punkt: implizite vs. explizite Architektur

Brownfield = implizite Architektur:

- Architektur lebt im Code
- Specs dürfen unvollständig sein
- Wichtiger als „Design“ ist:
  - Regression-Schutz
  - Invarianten
  - Beobachtbares Verhalten

SpecKit unterstützt das:

- Specs als Schutzschild
- nicht als Idealbild

BMAD arbeitet dagegen:

- versucht implizites Wissen explizit zu machen
- was in Brownfield:
  - teuer
  - oft falsch
  - schnell veraltet

## 5) Empfehlung: SpecKit-Variante für Brownfield (konkret)

Ich würde dir keinen „vollen SpecKit-Flow“ empfehlen, sondern eine abgespeckte Brownfield-Edition.

### Für Bugfixes

`bug.md`

- observed behavior
- expected behavior
- non-goals
- risky areas

### Für Features

`feature.md`

- scope
- constraints (bestehende APIs, DB, UX)
- acceptance checks

### Immer

- „Was darf **nicht** geändert werden?“
- „Welche Tests müssen grün bleiben?“

➡ Das ist Spec-Driven ohne Prozessballast.

## 6) Klare Entscheidungsmatrix

| Kriterium                    | SpecKit      | BMAD           |
|-----------------------------|--------------|----------------|
| Brownfield-tauglich         | ✅ sehr       | ❌ schlecht     |
| Bugfix-Workflow             | ✅ optimal    | ❌ schwerfällig |
| Kontinuierliche Entwicklung | ✅            | ❌              |
| Geringer Overhead           | ✅            | ❌              |
| Architektur-Neubau          | ⚠️ begrenzt   | ✅              |
| Große Epics                 | ⚠️            | ✅              |

## Fazit (hart formuliert)

BMAD ist ein System zum Bauen neuer Systeme.
SpecKit ist ein Werkzeug zum Arbeiten in bestehenden Systemen.

Für dein Szenario:

- SpecKit als dünne Schicht
- keine Multi-Agent-Simulation
- Specs als Schutzmechanismus, nicht als Wahrheit

Wenn du willst, entwerfe ich dir im nächsten Schritt:

- eine „SpecKit-Brownfield-Minimalstruktur“
- oder konkrete Templates für Bugfix vs. Feature

Sag mir nur, welches davon du zuerst brauchst.