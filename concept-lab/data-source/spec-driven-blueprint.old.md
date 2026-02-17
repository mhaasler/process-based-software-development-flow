# Spec-Driven Development & AI-Native Engineering  
## Vortrags-Blueprint (Dev + Architekten) — Headlines + Speaker Notes

> Dieses Dokument ist ein **Baukasten**: grobe Struktur + ausbaufähige Notizen.  
> Es dient als **Kontext-Seed** für weitere Iterationen in neuen Chats.

---

## Slide 1 — Titel & Ziel
**Headline:** Spec-Driven Development: Prozesse für KI-fähige Softwareentwicklung  
**Speaker Notes:**
- Ziel heute: Nicht „KI-Tools“, sondern **Prozessänderungen**, damit KI zuverlässig produktiv wird.
- Kernfrage: **Was muss sich in Entwicklung, Steuerung (Governance) und Auslieferung ändern**, damit KI nicht nur Code schneller schreibt, sondern echte Entwicklungszeit spart?
- Das ist **der Kern der Diskussion**: hier trennt sich „KI benutzen“ von **KI wirksam einsetzen**.
- Ich formuliere das bewusst prozessual (nicht tool-fixiert), damit daraus eine **reife Architekten-/Dev-Diskussion** wird.

---

## Slide 2 — Grundthese (zentrale Leitfolie)
**Headline:** KI scheitert selten an Technik – sondern an impliziten Entwicklungsprozessen  
**Speaker Notes:**
- KI skaliert Geschwindigkeit, aber auch Fehler.
- KI wirkt wie ein **Stresstest für Entscheidungs- und Abstimmungsprozesse**.
- Viele heutige Prozesse sind optimiert für:
  - menschliche Kommunikation
  - implizites Wissen
  - soziale Abstimmung
- KI braucht dagegen:
  - explizite Artefakte
  - klare Verantwortlichkeiten
  - maschinenlesbare Entscheidungen
- These: **Der Engpass ist nicht das Tippen von Code, sondern Entscheidungsqualität & Explizitheit**.

---

## Slide 3 — Implizit → Explizit (der große Shift)
**Headline:** Klassisch: Architektur „entsteht“ — KI-fähig: Architektur wird formuliert  
**Speaker Notes:**
- Agile Teams kompensieren Unklarheit durch Gespräche, Refinement, Dailies, direkte Abstimmung.
- Das erzeugt ein gemeinsames mentales Modell – aber selten als diff-/reviewbares Artefakt.
- Wichtig: Das ist nicht „schlecht“, sondern menschlich effizient.
- Heute (typisch):
  - Architektur „entsteht", Regeln sind Konventionen
  - Wissen lebt in Köpfen, Doku ist erklärend (nicht normativ)
- Ergänzung (der große Shift Implizit → Explizit):
  - Klassische Entwicklung (typisch):
    - Architektur „entsteht“
    - Regeln sind Konventionen
    - Wissen lebt in Köpfen
    - Doku ist erklärend, nicht normativ
  - KI-fähige Entwicklung:
    - Architektur wird **formuliert**
    - Regeln sind **geschrieben**
    - Wissen ist **versioniert**
    - Artefakte sind **bindend**

---

## Slide 4 — Der KI-Bruch: Implizites existiert nicht
**Headline:** Für KI existiert nur, was explizit ist  
**Speaker Notes:**
- KI kann nicht „zwischen den Zeilen lesen“ wie erfahrene Devs/Architekten.
- Fehlende Klarheit → KI rät → falscher Code wird nur schneller produziert.
- Konsequenz: Prozesse müssen **implizit → explizit** transformieren.
- Merksatz: *Alles, was nicht explizit ist, existiert für KI nicht.*

---

## Slide 5 — Der neue Kern: Entscheidungen als Artefakte
**Headline:** Agilität verschiebt sich: von Gesprächen zu Artefakten  
**Speaker Notes:**
- Kommunikation bleibt wichtig, aber **nicht mehr die Quelle der Wahrheit**: Artefakte sind führend.
- KI-fähige Agilität: schnelle Iteration auf **Spezifikation & Entscheidungen** – nicht nur auf Code.
- Merksatz: *Agilität = schnelle Lernzyklen, nicht Ritualtreue.*

---

## Slide 6 — Was ist Spec-Driven Development (SDD)?
**Headline:** Spec zuerst – und ständig  
**Speaker Notes:**
- SDD: Spezifikation ist **Single Source of Truth**.
- Code/Tests/Doku werden daraus abgeleitet.
- Wichtige Abgrenzung: Das ist kein „Wasserfall 2.0“, sondern **ein Regelkreis** (Spec → Ableiten → Feedback → Spec).

---

## Slide 7 — Specs: Was gehört rein (und was nicht)
**Headline:** Specs sind normativ, nicht „Doku“  
**Speaker Notes:**
- Enthalten: Use Cases, Regeln/Invarianten, Vor-/Nachbedingungen, Fehlerpfade, Schnittstellenverträge.
- Nicht enthalten: lange Fließtexte, Meinungen, Team-Geschichte.
- Specs sind **präzise genug für Maschine**, verständlich genug für Menschen.

---

## Slide 8 — Use Cases als “Bestes Spec-Format”
**Headline:** Use Cases schlagen User Stories (für KI & Architektur)  
**Speaker Notes:**
- User Story = Intention, aber zu unscharf.
- Use Case = Ablauf + Alternativen + Bedingungen.
- Use Cases sind **architekturformend**, weil sie Grenzen und Verantwortlichkeiten sichtbar machen.

---

## Slide 9 — SDD ist nicht Wasserfall: der Feedback-Unterschied
**Headline:** Wasserfall ist spät – SDD ist früh  
**Speaker Notes:**
- Wasserfall: große Specs, Validierung spät.
- SDD: kleine Specs, Ableitung sofort, Feedback schnell.
- KI macht Ableitung billig → Iteration wird praktikabel.

---

## Slide 10 — „Zwei Agilitäten“: Human ↔ Human vs Human ↔ Machine
**Headline:** Duale Agilität ist der Schlüssel  
**Speaker Notes:**
- Human ↔ Human: Discovery, Aushandlung, Priorisierung, Tradeoffs.
- Human ↔ Machine: Spezifikation, Ableitung, Validierung, Varianten.
- Ergebnis: Wir brauchen eine Prozessschicht, die **Gespräche in Spezifikationen überführt**.

---

## Slide 11 — Tool-Rollen: Git, Jira, Confluence
**Headline:** Git ist Gesetz — Jira steuert Arbeit — Confluence erklärt Warum  
**Speaker Notes:**
- Specs gehören ins **Git**: versionierbar, diff-fähig, reviewbar, automatisierbar.
- Jira bleibt: Planung, Tracking, Ownership – aber nicht als Spec-Ablage.
- Confluence bleibt: Kontext, ADRs, Entscheidungen – aber nicht normativ.
- Regel: *Wenn etwas Verhalten definiert, gehört es ins Git.*
- Klarer Schnitt:
  - *Was* das System tut → Git (Specs)
  - *Warum* → Confluence (Kontext/Begründungen)
- Anti-Pattern: Tickets/Confluence werden Mini-Specs → Drift ist vorprogrammiert.
- Confluence heute (typisch): lange Seiten, Vermischung von Erklärung/Entscheidung/Spezifikation → hoher Drift.
- Jira heute (typisch): Tickets als Mini-Spezifikationen.
- Jira KI-fähig: *Kein Ticket ohne referenzierte Spec.*
- Ergänzung (Jira als Entscheidungs-Tracking):
  - Jira trackt vor allem: Spec-Änderungen, Entwurfsentscheidungen, Varianten (nicht „Wahrheitstexte“)
  - Praktisches Ticket-Muster: Link auf Spec + Akzeptanzkriterium = Spec geändert + Tests aktualisiert + Preview validiert

---

## Slide 12 — Agenten, Skills, MCP: Warum das zur Prozessfrage gehört
**Headline:** Nicht „eine KI“, sondern kontrollierte Fähigkeiten  
**Speaker Notes:**
- Für Teams ist KI oft besser handhabbar, wenn sie als **Werkzeugkasten (Skills)** mit klaren Grenzen genutzt wird (statt „magischer Alleskönner“).
- MCP/Tooling trennt Modell von Fähigkeiten → austauschbar, kontrollierbar.
- Architekturgedanke: Skills sind Ports/Schnittstellen für „AI-Capabilities“.
- Rollen entstehen ohnehin (Titel egal, Verantwortung zählt):
  - Spec Owner (Verhalten/Regeln)
  - AI Orchestrator (Agenten/Skills)
  - Reviewer (Abweichungen/Risiken)
  - Dev (Integration/Kontext)

---

## Slide 13 — Code Review: der kritischste Wandel
**Headline:** Spec-Review > Code-Review  
**Speaker Notes:**
- Klassisch: Code Review als Hauptgate → aber KI produziert viel Code → Review wird Bottleneck.
- Neu: Spec Review prüft Verhalten & Grenzen.
- Dann: automatisiert ableiten, Abweichungen prüfen, Code Review auf Risiken/Integration reduzieren.
- Optional provokant: *Code Reviews ohne Spec sind oft Stil-Debatten, keine Qualitätsgarantie.*
- Ergänzung (Details, wie im alten Draft):
  - Klassisches Code Review:
    - Stil, Patterns, persönliche Präferenzen
    - Diskussion auf Implementierungsebene
  - KI-fähiges Review:
    - **Spec Review > Code Review**
    - Leitfrage: Entspricht der Code der Spec (oder gibt es Abweichungen)?
  - Neue Review-Hierarchie:
    1) Spec Review (Architektur & Verhalten)
    2) Ableitung/Generierung
    3) Abweichungsprüfung
    4) Minimaler Code Review (Risiken/Integration)
  - Provokant (funktioniert gut im Vortrag): *Code Reviews ohne Specs sind Meinungen, keine Qualitätssicherung.*

---

## Slide 14 — Tests: von Implementierungsprüfung zu Verhaltensschutz
**Headline:** Tests sichern Architektur, nicht Code  
**Speaker Notes:**
- KI-stabile Tests sind Blackbox/Behavior-driven.
- Command-Tests: Given/When/Then entlang des Use Cases.
- Vorteil: Refactoring-resistenter, Architektur bleibt geschützt.
- Ergänzung (Einordnung):
  - Klassisch:
    - Unit-Tests, White-Box
    - fragil bei Refactoring
  - KI-fähig:
    - Command- & Use-Case-Tests, Blackbox
    - aus Specs abgeleitet (Given/When/Then entlang des Use Cases)
  - Merksatz: Tests sichern **Architektur & Verhalten**, nicht Code.

---

## Slide 15 — CI/CD: vom Delivery-Fließband zur Entscheidungsmaschine
**Headline:** Pipeline wird Entwurfsinstrument (Varianten/Previews/Feedback)  
**Speaker Notes:**
- Feature-Branches/Preview-Environments sind jetzt „Design-Varianten“.
- Pipeline prüft: Spec-Validierung → Ableitung → Preview → Feedback.
- Ergebnis: Kunden sehen Entwürfe als laufende Software, nicht als Tickettext.
- Ergänzung (Einordnung):
  - Klassisch: Build → Test → Deploy.
  - KI-fähig:
    - Spec validieren
    - Varianten generieren
    - Previews erzeugen
    - Feedback einsammeln
  - Ergebnis: Pipeline wird **Entwurfsinstrument / Entscheidungsmaschine**.

---

# Neue Ansätze (Skizze) + “How to start” (Slides 16–20)

## Slide 16 — Scrum: von Sprint-Output zu Entwurfs-Iteration
**Headline:** Nicht Code liefern – sondern Verhalten entscheiden  
**Speaker Notes:**
- Gespräche erzeugen Entscheidungen → Entscheidungen werden Artefakte (Specs).
- Erfolgskriterium: „Wie schnell kann ich eine Regel ändern und validieren?“
- Das ist für KI wichtiger als Sprint-Zeremonien.
- Neuer Sprint-Zweck: *Nicht Code liefern – sondern Verhalten entscheiden.*
- Ergänzung (Scrum-Mapping, wie im alten Draft):
  - Klassisch:
    - User Stories, Story Points, Velocity
    - Fokus: Output
  - KI-angepasst:
    - Use-Case-Specs, Entwurfsvarianten, Verhaltens-MVPs
    - Fokus: **Entscheidungen**

---

## Slide 17 — Neuer Ansatz 2: Spec-Branches statt Feature-Branches
**Headline:** Branches als Entwurfsvarianten, nicht nur Code-Isolation  
**Speaker Notes:**
- Branch A/B/C = unterschiedliche Spec-Varianten (schnell/sicher/vereinfachte UX).
- KI generiert Umsetzung pro Variante.
- Ergebnis: Vergleich & Entscheidung wird einfacher als „wir diskutieren es 2 Wochen“.

---

## Slide 18 — Neuer Ansatz 3: Governance-Leitplanken statt Freiheitsgrade
**Headline:** „No Spec, no merge“ (mit sinnvollen Ausnahmen)  
**Speaker Notes:**
- Policy-Idee: Jede Änderung, die Verhalten ändert, braucht Spec-Update.
- Ausnahmen: rein technische Refactorings ohne Verhaltensänderung (aber testgedeckt).
- Ownership: Spec Owner/Reviewer Rollen – nicht als Titel, sondern als Verantwortung.

---

## Slide 19 — How to Start: 30-Tage Einstieg (praxisnah)
**Headline:** Einstieg ohne Big Bang  
**Speaker Notes:**
- Woche 1: 1–2 kritische Use Cases als Specs im Git
- Woche 2: Tests aus Specs ableiten (mindestens Happy Path + 1 Fehlerpfad)
- Woche 3: Pipeline Preview pro Branch (oder pro PR) einführen
- Woche 4: Review-Shift ausprobieren (Spec Review als Pflicht, Code Review schlanker)
- MVP neu gedacht (sehr wichtig):
  - Klassisches MVP:
    - Feature-reduziert
    - oft technisch/semantisch unklar
    - viele implizite Annahmen
  - KI-fähiges MVP:
    - **Verhaltens-MVP** (klarer Scope, explizite Regeln)
    - ideal für Ableitung/Generierung, weil weniger geraten werden muss
  - Beispiel:
    - nicht: „Checkout light"
    - sondern: „Checkout nur Happy Path, keine Fehlerbehandlung"
- Ziel: Nachweis, dass Feedback schneller + weniger Drift.

---

## Slide 20 — Zielbild: AI-Native Engineering Operating Model
**Headline:** Entscheiden → Spezifizieren → Generieren → Lernen  
**Speaker Notes:**
- Meta-Modell:
  - menschliche Discovery
  - normative Specs
  - KI-Ableitung
  - schnelle Feedback-Loops
- Schlussfolgerung: KI zwingt Engineering, endlich **entscheidungsgetrieben** zu arbeiten.

---

## Slide 21 — Sehr klare Zusammenfassung
**Headline:** Was sich wirklich ändert  
**Speaker Notes:**
- KI braucht explizite Prozesse: Implizites Wissen wird zum Risiko.
- Specs schlagen Doku (normativ in Git, Kontext in Confluence).
- Entscheidungen schlagen Code: Review wandert nach vorne (Spec Review > Code Review).
- Tests sichern Verhalten/Architektur (Blackbox/Use-Case-Tests) statt Implementierungsdetails.
- CI/CD wird Design-Werkzeug (Varianten/Previews/Feedback).
- Typische Widerstände:
  - „zu viel Overhead" (kurzfristig ja, langfristig spart es massiv)
  - „wir sind agil, wir brauchen das nicht" (ohne Artefakte funktioniert es nur mit Menschen)
  - „KI macht das schon" (KI verstärkt schlechte Prozesse brutal)

---

## Slide 22 — Starke Abschlussfrage (Diskussion garantiert)
**Headline:** Wo sitzt euer Engpass wirklich?  
**Speaker Notes:**
- Frage ans Publikum:  
  „Was ist bei euch teurer zu ändern: Code oder Entscheidung?“  
- Alternativ:  
  „Welche Architekturregeln existieren nur im Kopf – und sind nicht testbar?“
- Alternativ (Diskussion garantiert):
  „Welche Teile eures Entwicklungsprozesses leben heute ausschließlich von implizitem Wissen?"

---

# Appendix-Paket (Baukasten) — Vertiefungsfolien

## Appendix — Schnellzugriff (für Vortrag)
**Headline:** Finde die richtige Vertiefung in 10 Sekunden  
**Speaker Notes:**
- Shortcut: `Cmd+F` nach `A6`, `Review`, `Use Case`, `Preview`, `Anti-Patterns`
- [A1 Use-Case-Template](#appendix-a1--spec-template-use-case-markdown-struktur) (passt zu Slides 7/8/14) — Keywords: Use Case, Vorbedingungen, Fehlerpfade
- [A2 Spec-Repo Struktur](#appendix-a2--spec-repo-struktur-git-als-single-source-of-truth) (passt zu Slides 6/11) — Keywords: Git, Specs, Struktur
- [A3 Jira](#appendix-a3--jira-im-sdd-tickets-steuern-arbeit-nicht-verhalten) (passt zu Slide 11) — Keywords: Ticket, Ownership
- [A4 Confluence](#appendix-a4--confluence-im-sdd-kontext-adrs-warum) (passt zu Slide 11) — Keywords: ADR, Kontext, „Warum“
- [A5 Scrum/Kanban Mapping](#appendix-a5--scrumkanban-mapping-was-bleibt-was-%C3%A4ndert-sich) (passt zu Slides 3/5/19) — Keywords: Refinement, Sprint Goal
- [A6 Spec-Review Checkliste](#appendix-a6--review-guidelines-spec-review-checkliste) (passt zu Slide 13) — Keywords: Spec Review
- [A7 Testing-Shift](#appendix-a7--testing-shift-von-unit-pyramide-zu-behavior-schutz) (passt zu Slide 14) — Keywords: Behavior, Contract Tests
- [A8 CI/CD Preview](#appendix-a8--cicd-blueprint-preview-environments-f%C3%BCr-varianten) (passt zu Slides 15/17) — Keywords: Preview, Pipeline
- [B1 Skills/Operating Model](#bonus-appendix-b1--agentenskills-operating-model-kurz) (passt zu Slide 12) — Keywords: Skills, MCP
- [B2 Anti-Patterns](#bonus-appendix-b2--anti-patterns-was-teams-fast-immer-falsch-machen) (passt zu Slides 2/4/13/15) — Keywords: Drift, Bottleneck

## Appendix A1 — Spec-Template: Use Case (Markdown-Struktur)
**Headline:** Minimaler Use-Case-Spec, der KI wirklich hilft  
**Speaker Notes:**
- Passt zu: Slides 7/8 (Specs/Use Cases) und Slide 14 (Tests als ausführbare Specs)
- Keywords: Use Case, Vorbedingungen, Alternativen, Fehlerpfade
- Ziel: kein Roman, sondern ein **maschinenlesbarer Ablauf**.
- Template-Bausteine:
  - Kontext / Ziel
  - Vorbedingungen
  - Hauptablauf (Steps)
  - Alternativen / Fehlerpfade
  - Nachbedingungen
  - Invarianten (falls betroffen)
- Wichtig: Jeder Schritt = **beobachtbares Systemverhalten**, keine UI-Details.

---

## Appendix A2 — Spec-Repo Struktur (Git als „Single Source of Truth“)
**Headline:** Wie ein Spec-Repo in der Praxis aussieht  
**Speaker Notes:**
- Passt zu: Slides 6 (Spec zuerst) und 11 (Git/Jira/Confluence)
- Keywords: Git, Struktur, Single Source of Truth
- Motivation: Specs sind wie Code: versionieren, reviewen, automatisieren.
- Vorschlag (leichtgewichtig, erweiterbar):

```
/specs
  /use-cases
  /commands
  /events
  /domain
    glossary.md
    invariants.md
  /contracts
    openapi.yaml
```

---

## Appendix A3 — Jira im SDD: Tickets steuern Arbeit, nicht Verhalten
**Headline:** Jira wird Arbeitslog – nicht Spezifikationsort  
**Speaker Notes:**
- Passt zu: Slide 11 (Tool-Rollen)
- Keywords: Tracking, Ownership, Ticket-Pattern
- Jira bleibt wichtig für Priorisierung, Ownership, Timeline/Status.
- Tickets enthalten **nicht** die normative Wahrheit.
- Gutes Ticket-Pattern: Link auf Spec + Akzeptanzkriterium = Spec geändert + Tests aktualisiert + Preview validiert.
- Ergänzung (Heute vs. KI-fähig):
  - Heute:
    - Tickets = Mini-Spezifikationen
    - viel Text, wenig Struktur
  - KI-fähig:
    - Jira trackt Spec-Änderungen, Entwurfsentscheidungen, Varianten
    - Regel: *Kein Ticket ohne referenzierte Spec.*

---

## Appendix A4 — Confluence im SDD: Kontext, ADRs, „Warum“
**Headline:** Confluence verliert Normativität – gewinnt Kontext  
**Speaker Notes:**
- Passt zu: Slide 11 (Tool-Rollen)
- Keywords: ADR, Kontext, „Warum"
- Confluence ist ideal für Hintergründe, ADRs, Onboarding.
- Regel: Wenn Confluence und Git widersprechen → Git gewinnt.
- Best Practice: Confluence verweist auf normative Git-Specs.
- Ergänzung (Heute vs. KI-fähig):
  - Heute (typisch):
    - lange Seiten
    - Vermischung von Erklärung, Entscheidung, Spezifikation
    - hoher Drift
  - KI-fähig:
    - Confluence erklärt Kontext/Motivation/Begründung (nicht normativ)

---

## Appendix A5 — Scrum/Kanban Mapping: Was bleibt, was ändert sich?
**Headline:** Agil bleibt – aber die Outputs werden anders  
**Speaker Notes:**
- Passt zu: Slides 3/5 (Agilität & Artefakte) und Slide 19 (How to Start)
- Keywords: Refinement, Output, Sprint Goal
- Dailies: Blocker & Koordination (menschlich)
- Refinement: Ergebnis muss Spec-Update oder Spec-Skizze sein
- Sprint Goals: verhaltensbezogen („Happy Path MVP läuft als Preview“)
- Retros: bleibt menschlich

---

## Appendix A6 — Review-Guidelines: Spec-Review Checkliste
**Headline:** Was man im Spec-Review prüft (statt Code-Style)  
**Speaker Notes:**
- Passt zu: Slide 13 (Spec Review > Code Review)
- Keywords: Spec Review, Systemgrenze, Vor-/Nachbedingungen
- Checkliste:
  1) Systemgrenze klar?
  2) Vor-/Nachbedingungen vollständig?
  3) Fehlerpfade definiert?
  4) Invarianten/Regeln explizit?
  5) Inputs/Outputs testbar?
  6) Mehrdeutigkeiten eliminiert?

---

## Appendix A7 — Testing-Shift: Von Unit-Pyramide zu Behavior-Schutz
**Headline:** KI-stabile Tests: weniger White-Box, mehr Verhalten  
**Speaker Notes:**
- Passt zu: Slide 14 (Tests als ausführbare Specs)
- Keywords: Behavior, Contract Tests, Use-Case-Tests
- Fokus: Contract/Use-Case/Command-Tests, weniger fragile Strukturtests.
- Tests werden Architektur-Guards.

---

## Appendix A8 — CI/CD Blueprint: Preview-Environments für Varianten
**Headline:** Preview pro Branch = schnellere Kundenentscheidungen  
**Speaker Notes:**
- Passt zu: Slides 15 (Design-Pipeline) und 17 (Varianten)
- Keywords: Preview, Pipeline, Feedback
- Pipeline: Spec-Validation → Generierung → Preview → Feedback-Hook
- Nutzen: „Show, don’t tell“, weniger Missverständnisse, schnellere Freigaben

---

## Bonus Appendix B1 — Agenten/Skills Operating Model (kurz)
**Headline:** Skills als kontrollierte KI-Fähigkeiten  
**Speaker Notes:**
- Passt zu: Slide 12 (Agenten/Skills/MCP)
- Keywords: Skills, MCP, auditierbar
- Beispiele: `generate_code_from_spec`, `derive_tests_from_use_case`, `validate_spec_consistency`
- Vorteile: auditierbar, wiederholbar, policy-fähig

---

## Bonus Appendix B2 — Anti-Patterns (was Teams fast immer falsch machen)
**Headline:** Typische Fehler beim KI-Enablement  
**Speaker Notes:**
- Passt zu: Slides 2/4 (Prozessdruck/Explizitheit) sowie 13/15 (Review/Pipeline)
- Keywords: Drift, Bottleneck, „No Spec"
- „Wir prompten uns zum Feature“ (ohne Spec)
- Confluence/Jira wird Spec-Quelle → Drift
- Code Review wird zum Bottleneck
- Keine Preview-Loops → Feedback kommt zu spät
