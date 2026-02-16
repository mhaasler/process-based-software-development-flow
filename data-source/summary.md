## KI‑fähige, spec‑getriebene Softwareentwicklung
Ein konsolidiertes, kapitelbasiertes Dokument mit Struktur, Unterpunkten und vertiefenden Erläuterungen aus allen bereitgestellten Quellen

---

### Inhaltsverzeichnis
1. Einleitung und Executive Summary  
2. Warum der Wandel: Von codezentriert zu prozessbasiert  
3. Agilität mit KI: Duale Agilität und Stakeholder‑Shift  
4. Implizit → Explizit: Der zentrale Prozesswandel  
5. Spec‑Driven Development (SDD): Prinzipien, Artefakte und Regeln  
6. Wasserfall vs. SDD: Abgrenzung und Lernschleifen  
7. Tests als ausführbare Spezifikationen  
8. Operating Model: KI als Umsetzer, nicht als Teilnehmer  
9. Lokaler Multi‑Agent‑Workflow mit Copilot: Architektur, Repo‑Struktur, Agenten  
10. Orchestrierung und Qualitätsschranken (Gates)  
11. Rituale und Reviews neu gedacht  
12. Tools & Governance: Git, Jira, Confluence  
13. MVP als Verhaltensschnitt  
14. Brownfield‑Strategie: SpecKit vs. BMAD  
15. Anti‑Patterns, Risiken und typische Widerstände  
16. Einführung: 30‑Tage‑Plan, Metriken, Policies  
17. Anhänge: Checklisten, Templates, Diagramme

---

## 1. Einleitung und Executive Summary
Agilität hat sich historisch als Kommunikationskunst etabliert: Menschen gleichen Unschärfen durch Gespräche, gemeinsame mentale Modelle und iterative Abstimmung aus. KI verändert diesen Kontext fundamental. Modelle sind schnell, aber nicht „zwischen den Zeilen“ kompetent; sie benötigen explizite, maschinenlesbare Entscheidungen. Daraus folgt kein Ende von Agilität, sondern eine Verschiebung: Kommunikation bleibt der menschliche Motor, Artefakte (Specs, Regeln, Tests) werden zur Wahrheit für Maschinen.

Kernthesen:
- Agilität für Menschen = Kommunikation. Agilität für KI = Explizitheit.
- Alles, was nicht explizit ist, existiert für KI praktisch nicht.
- Spec‑Driven Development (SDD) macht Spezifikationen zur Quelle der Wahrheit; Code implementiert sie.
- Review verschiebt sich nach vorne: Entscheidungen/Verhalten prüfen, dann generieren, Abweichungen prüfen, zuletzt schlanker Code‑Review.
- Praktische Umsetzung gelingt lokal und reproduzierbar mit einem Multi‑Agent‑Workflow (Copilot), klaren Rollen, Artefakt‑Handoffs und harten Qualitätsschranken.

---

## 2. Warum der Wandel: Von codezentriert zu prozessbasiert
### 2.1 Status quo „traditionelle Entwicklung“
- Feature → Ticket → Entwickler tippt → PR → Review → Merge; Code ist das primäre Ergebnis.
- Architektur „entsteht“; Dokumentation entsteht nebenher und selten normativ.
- KI wird höchstens als Autocomplete gesehen; menschliches Tippen dominiert.

### 2.2 Prozessbasiertes Paradigma
- Idee → Spec → Validierung → Generierung → Tests → Gates → Review; der Workflow steuert Ergebnisse.
- 70–80 % mechanische Tätigkeiten sind automatisierbar. Engpässe verschieben sich zu:
  - Entscheidungsqualität (Scope, Regeln, Grenzen)
  - Systemdenken (Architektur, Verträge, Invarianten)
  - Testbarkeit und Governance (vorhersehbare Evolution)

### 2.3 Strategischer Effekt
- Fokuswechsel von „Code schreiben“ zu „Systeme und Prozesse entwerfen, die Code erzeugen“.
- Rollen wandeln sich: Systemarchitekt, Prozessdesigner, Qualitäts‑Gatekeeper, Kontext‑Engineer.

Beispiel:
- Früher: „Implementiere Checkout“.  
- Heute: „Definiere den Happy Path Checkout als Use‑Case‑Spec (Vor/Nachbedingungen, Fehlerpfade); generiere Umsetzung + Tests; prüfe Gates; iteriere am Spec.“

---

## 3. Agilität mit KI: Duale Agilität und Stakeholder‑Shift
### 3.1 Das klassische agile Muster
Unklarheit → Kommunikation → gemeinsames Verständnis → Code. Menschen kompensieren fehlende Präzision durch Gespräche.

### 3.2 Der KI‑Bruch
- KI ist nicht interpretierend, nicht aushandelnd, nicht empathisch.  
- Unklarheit + fehlende „Zwischen‑den‑Zeilen“-Kompetenz → Fehlannahmen → falscher Code (nur schneller).

Kernaussage: Prozesse, die auf impliziter Kommunikation basieren, sind nicht KI‑fähig.

### 3.3 Duale Agilität
- Mensch ↔ Mensch: Gespräche, Workshops, Priorisierung, Aushandlung.
- Mensch ↔ Maschine: Spezifikationen, Regeln, Artefakte (bindend, versioniert).

### 3.4 Stakeholder‑Shift
- Klassisch: Stakeholder erklären, Devs interpretieren, Missverständnisse werden im Gespräch korrigiert.
- KI‑fähig: Stakeholder entscheiden; Teams formalisieren; KI setzt um. Verantwortung rückt nach vorne.

---

## 4. Implizit → Explizit: Der zentrale Prozesswandel
### 4.1 Warum Explizitheit?
KI leistet keine „Kontextintelligenz“ wie Menschen. Explizite Entscheidungen, überprüfbare Aussagen und klare Grenzen sind die Brücke zwischen menschlichem Denken und maschineller Ausführung.

### 4.2 Artefakte als Wahrheit
- Spezifikationen fungieren als formalisierte Kommunikation zwischen Mensch und Maschine.
- Explizite Regeln, Invarianten, Verträge, Use Cases, Akzeptanzkriterien werden versioniert und überprüfbar.

### 4.3 Rollen der Tools (Schnitt)
- Was das System tut (normatives Verhalten) → Git (Specs).
- Warum es so ist (Kontext/Begründung) → Confluence.  
- Arbeit steuern (Priorisierung/Status) → Jira.

---

## 5. Spec‑Driven Development (SDD): Prinzipien, Artefakte und Regeln
### 5.1 Grundprinzipien
- Specs sind Single Source of Truth. Code implementiert Specs. Code ist niemals selbst die Spec.
- Verhaltenänderungen erfordern Spec‑Änderungen (vor oder gemeinsam mit Code).
- Qualität lokal deterministisch prüfen (Format, Lint, Tests, ggf. Schema/Doku).

### 5.2 Arten von Specs
- Architektur‑/Gesetzes‑Specs: Systemweite, nicht verhandelbare Regeln (Schichten, Abhängigkeiten, Test‑Pflichten). Selten geändert, stark normierend.
- System/Feature‑Specs: Verhalten, Zustände, Schnittstellen, Invarianten; mittlere Änderungsfrequenz; Grundlage für Implementierung/Tests.
- Komponenten/Modul‑Specs: Identität, Konfiguration, Inputs/Outputs, Fehlerfälle, Laufzeitverhalten; granular und isoliert testbar.

### 5.3 Regeln für Änderungen
- Gilt: neue Features, geänderte Semantik, neue Fehlerfälle, geänderte Defaults.
- Gilt nicht: reine Refactorings, Umbenennungen, Formatierung, reine Performance ohne Semantikänderung.

### 5.4 MVP vs. Gesamtlösung
- MVP ist Implementierungsstrategie, nicht Spezifikationsstrategie.  
- Specs bleiben vollständig; Implementierung liefert zuerst einen minimalen End‑to‑End‑Slice (Happy Path) als Integrationsbeweis, nicht als „halbfertiges“ Feature.

Expertentipp: Beginne mit Contracts & Invarianten (Interfaces, Fehlercodes, Datenmodelle). Dann ein minimaler End‑to‑End‑Slice; erst danach Ausbau zu Gesamtlösung.

---

## 6. Wasserfall vs. SDD: Abgrenzung und Lernschleifen
### 6.1 Missverständnis adressieren
„Spec zuerst“ klingt nach Wasserfall, ist aber in SDD ein iterativer Regelkreis: Spec wird klein, lebendig und ständig angepasst.

### 6.2 Der entscheidende Unterschied
- Wasserfall: große, monolithische Specs; Validierung spät; Änderungen teuer.
- SDD: kleine Spec‑Änderungen; sofortige Ableitungen (Code/Tests/Preview); frühes Feedback; Anpassung günstig und erwartet.

### 6.3 Praktischer Effekt
- Spec ist Arbeitsmedium, nicht Abschlussdokument.
- KI macht Ableitungen billig; Varianten und Verwerfen werden praktikabel.

---

## 7. Tests als ausführbare Spezifikationen
### 7.1 Testing‑Shift
- Klassisch: Unit‑Tests, White‑Box, refactoring‑fragil.
- KI‑fähig: Use‑Case/Command‑Tests, Black‑Box, aus Specs abgeleitet.

### 7.2 Rolle der Tests
- Tests beweisen Akzeptanzkriterien.  
- Sichern Verhalten und Architektur (Verträge, Invarianten), nicht Implementierungsdetails.  
- Definition of Done auf Task‑Ebene: Akzeptanzkriterium ist durch Tests reproduzierbar.

Praxisbeispiel:
- Use‑Case „Checkout Happy Path“: Given gültiger Warenkorb und Zahlungsmittel; When Nutzer bestellt; Then Bestellung ist „confirmed“, Inventar reduziert, Bestätigungs‑Email gesendet. Tests decken genau diesen Ablauf.

---

## 8. Operating Model: KI als Umsetzer, nicht als Teilnehmer
### 8.1 Klare Rollen der KI
- KI ist kein Teammitglied, kein Stakeholder, kein Diskussionspartner.
- KI ist Umsetzer, Varianten‑Generator, Konsequenzverstärker.

### 8.2 Konsequenz
- Diskussionen bleiben menschlich.  
- Umsetzung (Code/Tests/Doku) wird maschinell beschleunigt.  
- Agilität verschiebt sich vom Gespräch zur schnellen Änderung von Artefakten.

---

## 9. Lokaler Multi‑Agent‑Workflow mit Copilot: Architektur, Repo‑Struktur, Agenten
### 9.1 Grundprinzipien
- Local‑only: Alle Entscheidungen, Prompts, Regeln und Outputs im Repository.
- Spec as Source of Truth: Code implementiert Specs; keine Chat‑Abhängigkeiten.
- Agenten = Rollen mit klaren Handoffs; deterministische Qualitätsschranken (Gates).
- Kein implizites Wissen: Wichtige Inhalte stehen in Dateien (Specs/Instructions/Agent‑Profile).

### 9.2 Zielarchitektur des Workflows
- Specs → Planner → Implementer → Tester → Reviewer; jeder Agent produziert Artefakte, die der nächste nutzt (Datei‑Handoffs statt Chat‑Handoffs).

### 9.3 Empfohlene Repo‑Struktur
- specs/: constitution.md; architecture/ (context, ADRs); features/<feature>/{spec.md, plan.md, tasks.md, review.md}  
- .github/: copilot‑instructions; instructions/*; agents/* (architect/planner/implementer/tester/reviewer)  
- scripts/: workflow.sh; gates/{format.sh, lint.sh, test.sh}; prompts/*  
- Makefile/justfile; README.md

### 9.4 Agentenprofile (Rollen und Output‑Verträge)
- Architect: Spezifikation/Architektur (SDD), ADRs, Annahmen offenlegen.  
- Planner: Zerlegt Plan in kleine Tasks mit AC/Tests/Dependencies.  
- Implementer: Implementiert genau einen Task minimal und reviewbar.  
- Tester: Ergänzt/erstellt Tests, behebt Gate‑Failures minimal.  
- Reviewer: Review gegen Specs/Constitution; findings inkl. Severity (BLOCKER/MAJOR/MINOR).

Vertiefung: In „AUTOMATION MODE“ liefern alle Agenten ausschließlich unified diff Patches zwischen [BEGIN PATCH] und [END PATCH], damit git apply —3way deterministisch funktioniert.

---

## 10. Orchestrierung und Qualitätsschranken (Gates)
### 10.1 Artefakt‑Handoffs statt Chat‑Handoffs
- Architect → aktualisiert Spec/Plan/ADRs.  
- Planner → erstellt tasks.md mit Akzeptanzkriterien und Testanforderungen.  
- Implementer → ändert Code minimal; ergänzt ggf. Doku.  
- Tester → schreibt/erweitert Tests; macht Gates grün.  
- Reviewer → schreibt review.md mit pass/fail und findings; PR‑Kommentare.

### 10.2 Gates
- Format, Lint, Tests und ggf. Schema/Doku‑Checks sind lokal ausführbar und agent‑neutral.  
- Ein Task ist „fertig“ nur, wenn alle Gates erfüllt sind.

### 10.3 Orchestrator
- Einfaches Skript/Runner (z. B. auto_workflow.py) lädt vordefinierte Prompts, extrahiert Patches, wendet sie an, führt Gates aus, looped bei Fehlern (mit Feedback an Agenten).  
- State‑Machine: Spec → Plan → Tasks → Implementer/Test‑Loop → Reviewer → PR.

---

## 11. Rituale und Reviews neu gedacht
### 11.1 Was kippt, was bleibt?
- Daily: KI braucht es nicht; menschliche Koordination bleibt.  
- Grooming/Refinement: Ergebnis muss formalisiert werden (Spec/Tasks), nicht nur Gespräch.  
- Retros: bleibt menschlich.

### 11.2 Review‑Shift
- Reihenfolge: Spec Review → Generierung → Abweichungsprüfung → schlanker Code‑Review.  
- Leitfrage: Entspricht der Code der Spec? Wo gibt es Abweichungen oder implizite Annahmen?

Merksatz: Code‑Reviews ohne Specs sind Meinungen, keine Qualitätssicherung.

---

## 12. Tools & Governance: Git, Jira, Confluence
### 12.1 Saubere Rollen
- Git ist normativ: Specs, Tests, Verträge (diff‑/review‑/automation‑fähig).  
- Jira steuert Arbeit: trackt Spec‑Änderungen, Entscheidungen, Varianten; kein Ort für normative Wahrheit.  
- Confluence erklärt das „Warum“: Motivation, Begründung, ADR‑Historie; bei Widerspruch gewinnt Git.

### 12.2 Policy‑Beispiel
- „No Spec, no merge“ mit Ausnahmen:
  - Ausnahme: reine Refactorings ohne Verhaltensänderung, aber testgedeckt.  
  - Jede Abweichung von Spec → Spec/Plan aktualisieren oder als Ausnahme dokumentieren.

---

## 13. MVP als Verhaltensschnitt
### 13.1 Neuinterpretation
- MVP = minimaler, klar definierter Verhaltensentwurf (Happy Path), nicht „Feature light“.  
- Ideal für KI‑Generierung: weniger Ratespiel, mehr Präzision.

### 13.2 Beispiel
- Nicht: „Checkout light“.  
- Sondern: „Checkout Happy Path, keine Fehlerbehandlung“ mit klaren Vor/Nachbedingungen.

Nutzen: Frühe Validierung von Schnittstellen/Regeln, schneller Stakeholder‑Feedback‑Loop über Previews.

---

## 14. Brownfield‑Strategie: SpecKit vs. BMAD
### 14.1 Brownfield‑Realität
- Implizite Architektur; laufende Fixes und kleine Features; lokale Entscheidungen; Specs müssen schnell entstehen und schnell veralten dürfen.

### 14.2 Warum SpecKit passt
- Inkrementell, leichtgewichtig, feature‑lokal:
  - Mini‑Spec („Was soll sich ändern?“)
  - Constraints („Was darf nicht kaputtgehen?“)
  - Tasks („Minimaler Umsetzungsplan“)
- Ziel: „Fix dieses Verhalten, brech X nicht“, „Feature Y unter bestehenden Constraints“.

### 14.3 Warum BMAD kollidiert
- Simuliert vollständiges, idealisiertes Produktteam mit schweren Phasen; erzeugt Overhead in Brownfield‑Kontexten, in denen Architektur im Code „eingefroren“ ist.

### 14.4 Entscheidungsmatrix (Kurz)
- Brownfield‑tauglich: SpecKit sehr; BMAD schlecht.
- Bugfix‑Workflow: SpecKit optimal; BMAD schwerfällig.
- Architektur‑Neubau/Große Epics: BMAD stark; SpecKit begrenzt.

Empfehlung: Dünne SpecKit‑Schicht (bug.md/feature.md + constraints/tests), kein Rollenspiel‑Overhead.

---

## 15. Anti‑Patterns, Risiken und typische Widerstände
### 15.1 Häufige Fehler
- „Wir prompten uns zum Feature“ ohne Spec → Drift, Rework, Bottlenecks.  
- Confluence/Jira als normative Quelle → Widersprüche, fehlende Automatisierung.  
- Code‑Review als Hauptgate bei KI‑Code → Stil‑Debatten statt Qualitätssicherung.

### 15.2 Wann SDD kippt
- Specs eingefroren; Feedback ignoriert; Specs als Kontrollinstrument statt Lernmedium; Änderungen politisiert.

### 15.3 Umgang mit Widerstand
- Overhead‑Argument: kurzfristig real, langfristig spart Explizitheit massiv.  
- „Wir sind agil, wir brauchen das nicht“: Agil ohne Artefakte funktioniert nur zwischen Menschen; mit KI braucht es Explizitheit.  
- „KI macht das schon“: KI verstärkt schlechte Prozesse brutal.

---

## 16. Einführung: 30‑Tage‑Plan, Metriken, Policies
### 16.1 30‑Tage‑Plan (inkrementell, ohne Big Bang)
- Woche 1: 1–2 kritische Use‑Cases als Specs im Git; Constitution (Nicht‑verhandelbares) anlegen.  
- Woche 2: Tests aus Specs ableiten (Happy Path + 1 Fehlerpfad); Gates verdrahten.  
- Woche 3: Preview pro Branch/PR; Review‑Shift ausprobieren (Spec Review Pflicht).  
- Woche 4: Kleines Feature mit lokalem Copilot‑Workflow umsetzen; review.md einführen; Retros auf Prozess.

### 16.2 Metriken zur Wirkung
- Zeit bis valider Preview (von Spec‑Update bis laufende Umgebung).  
- Anzahl sinnvolle Spec‑Änderungen/Woche (Lernfähigkeit).  
- Rework‑Quote (gefunden durch Reviewer/Tests).  
- Gate‑Stabilität (Anteil grüner Läufe).

### 16.3 Policies (konkret)
- „No Spec, no merge“ mit dokumentierten Ausnahmen.  
- „Akzeptanzkriterien → Tests“: Jede AC hat mindestens einen Testfall.  
- „Spec‑Branches als Entwurfsvarianten“: Previews je Variante; Entscheidungsmerge basierend auf Feedback.

---

## 17. Anhänge: Checklisten, Templates, Diagramme
### 17.1 Spec‑Review Checkliste
- Systemgrenze klar? Vor/Nachbedingungen vollständig? Fehlerpfade definiert? Invarianten/Regeln explizit? Inputs/Outputs testbar? Mehrdeutigkeiten eliminiert?

### 17.2 Minimaler Use‑Case‑Spec (Struktur)
- Kontext/Ziel; Vorbedingungen; Hauptablauf (beobachtbares Verhalten, keine UI‑Details); Alternativen/Fehlerpfade; Nachbedingungen; Invarianten.

### 17.3 Task‑Block (Planner‑Template)
- Status (TODO/DOING/BLOCKED/DONE/FAILED); Goal; Acceptance Criteria (testbar); Required Tests; Likely Areas/Files; Dependencies (T‑001, T‑002, …).

### 17.4 Repo‑Skeleton (Kurzüberblick)
- specs/constitution.md; specs/architecture/*; specs/features/<feature>/{spec.md, plan.md, tasks.md, review.md}  
- .github/agents/*.agent.md (diff‑only Verträge in AUTOMATION MODE)  
- scripts/gates/* und scripts/prompts/*; auto_workflow.py als Orchestrator.

### 17.5 Visuelle Hilfen (Mermaid‑Diagramme)
- Duale Agilität (Human↔Human vs. Human↔Machine)  
- SDD‑Regelkreis  
- Review‑Shift  
- CI/CD als Design‑Pipeline  
Hinweis: Die Diagramme können 1:1 in Folien übernommen werden.

---
