# Constitution (Governance Minimum)

Diese Datei ist die **oberste Regelquelle** für das Repo/Modell.
Sie definiert **Autorität**, **Verbindlichkeit** und **Durchsetzung**.

## 1) Truth Sources (Autorität)
**Wahrheit** entsteht nur aus:
- `knowledge/nodes/*.md` (Nodes mit Frontmatter + Inhalt)
- `knowledge/galaxies/*.yml` (Galaxies)
- `knowledge/gradients/*.yml` (Gradients)
- `knowledge/governance/*.md` (Governance Policies)

Alles andere (Chat, Meetings, Notizen) ist **Entwurf**, bis es als Diff in obigen Files landet.

## 2) Nicht verhandelbare Regeln (MUST)
1. **Spec/Policy-first:** Änderungen an Regeln/Struktur werden als Diff in den Truth Sources gemacht.
2. **Gates sind bindend:** Broken Links/Refs sind ein Fehler, kein TODO.
3. **Ownership sichtbar:** Kritische Artefakte/Policies brauchen Owner (mindestens per Git History + klare Datei-Zuordnung).
4. **Security-by-default:** Keine Secrets in Repo/Logs/Chat. Isolation für riskante Ausführung.
5. **Auditability:** Entscheidungen/Änderungen müssen nachvollziehbar bleiben (Git + Links + ggf. ADRs).

## 3) Change Process (HOW)
- Jede Änderung an Truth Sources läuft über:
  1) Diff in Files
  2) `./scripts/knowledge_gate.sh` (oder äquivalent)
  3) Review (human oder agentisch), mindestens: "passt zur Constitution?"

## 4) Quality Gates (MUST RUN)
- `node scripts/validate_knowledge.mjs`
- `node build.mjs`
Optional (später): secret scanning, schema validation, policy linting.

## 5) KI/Agenten-Regeln
- KI liefert **Deltas** (Patch/Diff), keine stillen Umschreibungen.
- KI darf **Inbox** kuratieren, aber nicht ungeprüft Truth Sources „re-authorn“.
- KI führt keine riskante Ausführung ohne Sandbox-Profil aus (Netz/FS/Secrets default deny).

## 6) Failure Modes (Woran merkt man Drift?)
- Mehrere Wahrheiten pro Thema (Wiki/Chat konkurriert mit Files)
- Gates werden umgangen/ignoriert
- Nodes/Galaxies referenzieren nicht-existentes Material
- Security-Basics werden “später” gemacht
