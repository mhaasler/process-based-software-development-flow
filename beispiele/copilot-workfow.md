# Lokaler Multi-Agent-KI-Workflow (GitHub Copilot only)

Ziel: Ein vollständig lokaler, generischer Workflow für umfangreiche Softwareentwicklung – von Architektur & Spezifikation bis Implementierung und Pull-Request-Review – ohne zusätzliche kostenpflichtige Tools, ausschließlich mit GitHub Copilot.

Dieser Ansatz ist repo-basiert, reproduzierbar und framework-agnostisch. Er setzt bewusst keine Web-UI, keine externen SaaS-Agenten und keine CI-Pflicht voraus.

## 1. Grundprinzipien

1. **Local-only**  
   Alle Entscheidungen, Prompts, Regeln und Outputs liegen im Repository. Keine Abhängigkeit von Chat-Historien.
2. **Spec as Source of Truth**  
   Spezifikationen beschreiben das System. Code implementiert die Specs. Code ist niemals selbst die Spezifikation.
3. **Agenten sind Rollen, keine Magie**  
   Jeder Agent hat einen klaren Verantwortungsbereich, ein definiertes Output-Format und explizite Übergabepunkte (Handoffs).
4. **Deterministische Qualitätsschranken (Gates)**  
   Ein Task gilt nur als „fertig“, wenn lokale Gates (Tests, Lint, Format, Schema, Doku) erfüllt sind.
5. **Kein implizites Wissen**  
   Alles, was wichtig ist, steht in Dateien: Specs, Instructions, Agent-Profile.

## 2. Zielarchitektur des Workflows

```text
┌─────────────┐
│   Specs     │  ← Architektur, Regeln, Invarianten
└─────┬───────┘
      │
┌─────▼───────┐
│   Planner   │  ← Zerlegung in Tasks
└─────┬───────┘
      │
┌─────▼───────┐
│ Implementer │  ← Code
└─────┬───────┘
      │
┌─────▼───────┐
│   Tester    │  ← Tests & Validierung
└─────┬───────┘
      │
┌─────▼───────┐
│  Reviewer   │  ← Review gegen Specs & Regeln
└─────────────┘
```

Orchestrierung erfolgt lokal über:

- VS Code + Copilot Chat
- GitHub Copilot CLI (Terminal)
- einfache Shell-Skripte / Makefile / justfile

## 3. Repository-Struktur (empfohlen)

```text
.
├─ specs/
│  ├─ constitution.md
│  ├─ architecture/
│  │  ├─ context.md
│  │  ├─ adr-001-*.md
│  └─ features/
│     └─ <feature>/
│        ├─ spec.md
│        ├─ plan.md
│        └─ tasks.md
│
├─ .github/
│  ├─ copilot-instructions.md
│  ├─ instructions/
│  │  ├─ review.instructions.md
│  │  └─ language.instructions.md
│  └─ agents/
│     ├─ architect.agent.md
│     ├─ planner.agent.md
│     ├─ implementer.agent.md
│     ├─ tester.agent.md
│     └─ reviewer.agent.md
│
├─ scripts/
│  ├─ workflow.sh
│  └─ gates/
│     ├─ format.sh
│     ├─ lint.sh
│     └─ test.sh
│
├─ Makefile / justfile
└─ README.md
```

## 4. Die Agenten (generisch)

### 4.1 Architect Agent

**Aufgabe:**

- System- & Komponentenarchitektur
- Schnittstellen & Boundaries
- Invarianten, Risiken, Trade-offs

**Input:**

- `specs/constitution.md`
- Feature-Spec

**Output:**

- Architekturabschnitt
- ADR(s)
- explizite Annahmen

### 4.2 Planner Agent

**Aufgabe:** Architektur in umsetzbare Arbeit zerlegen.

**Output pro Task:**

- Ziel
- Akzeptanzkriterien
- Testanforderungen
- Abhängigkeiten

### 4.3 Implementer Agent

**Aufgabe:** Umsetzung einzelner Tasks.

**Regeln:**

- kleine, reviewbare Änderungen
- kein Architekturentscheid ohne Spec-Änderung

### 4.4 Tester Agent

**Aufgabe:**

- Tests definieren oder erweitern
- Edge-Cases und Regressionen identifizieren

**Definition of Done:** Tests reproduzieren das Akzeptanzkriterium.

### 4.5 Reviewer Agent

**Aufgabe:** Review gegen Specs, nicht gegen Bauchgefühl.

**Checkliste:**

- Verletzt der Code die Constitution?
- Fehlen Tests?
- Gibt es implizite Annahmen?
- Gibt es Abweichungen von der Architektur?

## 5. Custom Instructions (repo-weit)

**`.github/copilot-instructions.md` enthält:**

- Projektprinzipien
- Coding-Regeln
- Test-Pflichten
- Dokumentationspflichten

**`.github/instructions/review.instructions.md` mit `applyTo`:**

- erzwingt Review-Struktur
- standardisiert Review-Kommentare

## 6. Spec-Driven Flow (lokal)

1. Spec erstellen (`spec.md`)
2. Plan ableiten (`plan.md`)
3. Tasks definieren (`tasks.md`)
4. Task-Iteration:
   - Implementer
   - Tester
   - Reviewer
5. Pull Request
6. Copilot Review + manueller Review

Regel: Codeänderungen ohne Spec-Änderung sind Ausnahmefälle und müssen begründet werden.

## 7. Lokale Orchestrierung

### 7.1 Workflow-Skript (Beispielidee)

Ein simples `workflow.sh` kann:

- Phasen starten
- relevante Dateien öffnen
- Copilot CLI mit vorbereiteten Prompts aufrufen

Keine Magie – nur Struktur.

## 8. Qualitätsschranken (Gates)

Empfohlen:

- Format
- Lint
- Tests
- Schema-Validierung
- Docs-Check

Wichtig: Gates sind lokal ausführbar und agent-neutral.

## 9. Kernaussage

Ein guter KI-Workflow entsteht nicht durch mehr Agenten, sondern durch klare Rollen, explizite Regeln und harte Übergabepunkte.

GitHub Copilot ist dabei Ausführer, nicht Architekt. Die Architektur liegt im Repository.

## 10. Orchestrierung Example

### 10.1 Das zentrale Konzept: Artefakt-Handoffs statt Chat-Handoffs

Jeder Agent schreibt in eine Datei, die der nächste Agent als Input nutzt:

- Architect → schreibt/ändert: `specs/architecture/*`, `adr-*.md`, ergänzt `features/<f>/plan.md`
- Planner → schreibt: `features/<f>/tasks.md` (Taskliste inkl. AC + Tests)
- Implementer → ändert Code + ggf. `tasks.md`-Status
- Tester → ergänzt/erstellt Tests + ggf. Testplan in `plan.md`
- Reviewer → erzeugt Review-Report (z. B. `features/<f>/review.md`) + PR-Kommentare

So kann Orchestrierung lokal, deterministisch und auditierbar laufen.

### 10.2 Der Orchestrator ist ein simples Skript (oder Make/just)

Du orchestrierst über einen kleinen Runner, z. B. `scripts/workflow.sh`, der die Phasen in Reihenfolge abläuft und jeweils:

1. relevante Dateien öffnet/anzeigt,
2. Copilot (Chat oder CLI) mit einem vordefinierten Prompt startet,
3. danach Gates ausführt.

Beispiel-Phasen (Standard):

1. `spec` → Architect
2. `plan` → Architect
3. `tasks` → Planner
4. `impl` → Implementer (iterativ pro Task)
5. `test` → Tester (iterativ)
6. `review` → Reviewer + Copilot PR Review
7. `gate` → lokale Checks (`format` / `lint` / `test`)

Wichtig: Du kannst (4–5) beliebig oft loopen.

### 10.3 Der eigentliche Scheduler: Zustand + Regeln

Einfacher Zustand, z. B. in `features/<f>/tasks.md`:

- TODO / DOING / BLOCKED / DONE
- pro Task: Akzeptanzkriterien + Testanforderungen
- optional: „Owner Agent“ (Implementer/Tester)

Scheduling-Regeln:

- Planner darf neue Tasks nur anlegen, wenn ein Plan existiert.
- Implementer darf einen Task nur auf DONE setzen, wenn Gates grün sind (oder klar begründete Ausnahme).
- Reviewer prüft immer gegen Constitution + Specs, nicht nur Code-Stil.
- Jede Abweichung → Spec/Plan aktualisieren (oder explizit als Ausnahme dokumentieren).

### 10.4 Praktische Orchestrierungs-Patterns (lokal-only)

**Pattern A: Linear (für neue Features)**  
Architect → Planner → Implementer/Test-Loop → Reviewer

**Pattern B: Two-Track (Architektur stabil, Implementierung iterativ)**  
Architect stabilisiert ADRs & Boundaries, während Implementer in kleinen PRs liefert – aber nur innerhalb definierter Grenzen.

**Pattern C: Review-first (für riskante Änderungen)**  
Reviewer-Agent prüft zuerst Plan/Tasks (Design Review), dann erst Code Review.

### 10.5 Wie du Copilot konkret pro Agent aufrufst

Du hast drei gängige Trigger:

1. VS Code Copilot Chat
   - Agent wählen und z. B. anweisen: „Bearbeite `features/x/spec.md` und erstelle `plan.md` …“
2. Copilot CLI (Terminal, reproducible prompts)
   - pro Phase ein Befehl, der immer gleich ist (und auf Dateien verweist)
3. Repo Instructions
   - sorgen dafür, dass jeder Agent sich an Output-Formate hält

Entscheidend: Prompts referenzieren Dateien, nicht „Kontext im Kopf“.

### 10.6 Minimaler Orchestrierungs-Ablauf als State Machine

- S0: Spec fehlt → `run(Architect:spec)`
- S1: Plan fehlt → `run(Architect:plan)`
- S2: Tasks fehlen → `run(Planner:tasks)`
- S3: Tasks offen → Loop:
  - `run(Implementer:task_n)`
  - `run(Tester:task_n)`
  - `run(Gates)`
- S4: Alles DONE → `run(Reviewer)`
- S5: PR Review → Fix-Loop bei Findings

Das lässt sich 1:1 in ein Script gießen.