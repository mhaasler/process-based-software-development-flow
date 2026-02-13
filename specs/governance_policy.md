# Governance & Change Control Policy (Normative)

**Version 1.0 – Baseline**

---

## 1. Zweck

Diese Policy definiert, wie Entscheidungen, Änderungen und Ausnahmen im System gesteuert werden, so dass:
- Wahrheit artefaktbasiert bleibt (diff/review/merge)
- Layer-Disziplin stabil bleibt
- KI-Beschleunigung nicht zu Drift führt
- Security/Observability nicht optional werden
- Änderungen reversibel und nachvollziehbar sind

---

## 2. Geltungsbereich

Diese Policy gilt für alle Änderungen an:
- `specs/**` (Constitution, Policies, normative Specs)
- `knowledge/**` (Nodes, Galaxies, Inbox)
- Code (falls Teil des Repos)
- Build-/Gate-Skripten

---

## 3. Autorität & Truth Sources

### 3.1 Hierarchie der Wahrheit
1. `specs/constitution.md` (oberste Norm)
2. Policies in `specs/*.md` (ai_policy, governance_policy, security_policy, …)
3. System-/Feature-Specs (falls vorhanden)
4. `knowledge/**` (kuratiertes Wissensnetz)
5. Code (Implementierung, niemals Spec-Ersatz)
6. Chat/Notizen/Ad-hoc Output (nie autoritativ)

**Bei Konflikt gilt stets die höherstehende Ebene.**

---

## 4. Rollen & Verantwortlichkeiten

### 4.1 Rollen (logisch)
- **Spec Owner**: Verantwortet `specs/**`
- **Knowledge Owner**: Verantwortet `knowledge/**` Strukturqualität
- **Security Owner**: Verantwortet Security Policies/Enforcement
- **Observability Owner**: Verantwortet Signals/Telemetry/Runbooks
- **Module/Domain Owner**: Verantwortet Codebereiche (falls relevant)

### 4.2 KI-Rollen
KI kann Änderungen vorbereiten, aber keine Ownership tragen. Siehe `specs/ai_policy.md` und `specs/agent_roles_spec.md`.

---

## 5. Change Types & Required Process

Änderungen werden in Change Types klassifiziert. Je nach Typ gelten Gate- und Review-Pflichten.

### CT0 – Schreibfehler/Formatierung (trivial)
- **Scope:** Rein textlich, keine Bedeutungsänderung
- **Requirements:** Review optional, Gate empfohlen

### CT1 – Knowledge Update (Nodes/Links/Galaxies)
- **Scope:** `knowledge/**`
- **Requirements:** Diff-ready, Knowledge Gate zwingend. Review durch Agent oder Mensch.

### CT2 – Spec/Policy Update (normativ)
- **Scope:** `specs/**`
- **Requirements:** Diff-ready, Governance Review zwingend. Expliziter Änderungsgrund + ADR (optional).

### CT3 – Architekturentscheidung (boundaries/contracts)
- **Scope:** Große Struktur-Entscheidungen
- **Requirements:** ADR zwingend. Review durch Architecture + Governance. Impact-Analyse.

### CT4 – Security-relevant Change
- **Scope:** Secrets, Access, Sandboxing, Supply Chain
- **Requirements:** Security Review zwingend. Default deny Prinzip.

### CT5 – Observability-relevant Change
- **Scope:** Signals/SLOs/Runbooks
- **Requirements:** Observability Review zwingend. Actionability sicherstellen.

---

## 6. Gates (Durchsetzung)

Gates sind technische Schranken. Kein Merge ohne Gate-Erfolg.

### 6.1 Knowledge Gate
- `node build.mjs`
- Keine kaputten Node-IDs oder Links.
- Galaxies referenzieren existierende Nodes.

### 6.2 Policy Gate
- Keine Widersprüche zur Constitution.
- Klare, enforcebare Formulierungen.

---

## 7. Review-Regeln (Minimum)

Jede Änderung ab CT1 braucht:
- Was ändert sich? Warum? Konsequenzen?
- Welche Gates wurden ausgeführt?

Review fokussiert auf Drift-Vermeidung, Layer-Disziplin und Security.

---

## 8. Layer-Disziplin & Strukturregeln

### 8.1 Layer-Grenzen
- **Layer 0 (Core)**: Ändert sich selten; CT2/CT3 Pflicht.
- **Layer 1 (Governance)**: Normierend; keine „losen Ideen“.
- **Layer 3 (Details)**: Bleibt klein; keine Sammel-Nodes.

### 8.2 Node-Regeln
- Nodes enthalten Leitplanken + Failure-Modes, kein Wiki.
- 2–6 tragende Links pro Node. IDs sind stabil.

---

## 9. Exceptions (bewusste Abweichungen)

Ausnahmen sind erlaubt, aber niemals implizit. Sie erfordern Kontext, Scope, Timebox, Mitigation, Owner und einen Exit-Plan.

---

## 10. Inbox → Curation Governance

Inbox ist Rohmaterial, nicht Wahrheit. Kuratierte Wahrheit entsteht nur über diff-ready Output in `knowledge/nodes/`.

---

## 11. KI-Änderungen & Safeguards

KI darf Diffs erzeugen und Vorschläge machen, aber keine Specs/Policies still ändern oder Gates umgehen. Jeder KI-Output bleibt ein Vorschlag bis Gate+Review passierte.

---

## 12. Operational “Definition of Done”

Eine Änderung gilt als „done“, wenn Artefakte diff-ready sind, Gates grün sind und der Review abgeschlossen ist.

---

## 13. Revisionsprinzip

Diese Governance Policy ist versioniert.
