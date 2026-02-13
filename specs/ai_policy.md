# AI Usage & Governance Policy

**Version 1.0 – Baseline**

---

## 1. Zweck

Diese Policy definiert:
- Rolle der KI im System
- Erlaubte und verbotene Nutzungen
- Sicherheitsgrenzen
- Artefaktregeln
- Governance-Anforderungen
- Integrationsprinzipien

Sie stellt sicher, dass KI beschleunigt, ohne Wahrheit, Sicherheit oder Struktur zu untergraben.

---

## 2. Grundannahme

**KI ist ein:**
- Generator
- Strukturierer
- Assistent
- Refaktorierer

**KI ist nicht:**
- Autorität
- Wahrheit
- Governance-Ersatz
- Sicherheitsinstanz

---

## 3. KI-Arbeitsmodus

KI arbeitet ausschließlich über Artefakte.

**Erlaubt:**
- Erzeugen von Nodes (Markdown)
- Vorschlagen von Links
- Erzeugen von Diffs
- Refaktorisieren bestehender Artefakte
- Generieren von Templates
- Vorschlagen von Runbooks
- Generieren von Code-Vorschlägen

**Nicht erlaubt:**
- Direkte Änderung produktiver Systeme ohne Gate
- Änderung von Wahrheit ohne Diff
- Überschreiben von Policies
- Selbständige Eskalationsentscheidungen

---

## 4. Artefakt-Regel

Alle KI-Ergebnisse müssen:
1. Diffbar sein
2. Reviewbar sein
3. Gate-fähig sein
4. Versionierbar sein

> KI-Output, der nicht diffbar ist, gilt als nicht autoritativ.

---

## 5. Sicherheitsgrenzen

### 5.1 Secrets

**KI darf niemals:**
- Secrets lesen
- Secrets speichern
- Secrets generieren, die direkt produktiv verwendet werden
- `.env` Dateien ausgeben
- Credentials in Logs ausgeben

> Secrets werden ausschließlich über genehmigte Secret-Mechanismen verwaltet.

---

### 5.2 Sandboxing

**KI-Code-Ausführung:**
- Läuft isoliert
- Hat kein Default-Netzwerk
- Hat kein Zugriff auf Produktionsdaten
- Nutzt begrenzte Ressourcen
- Ist protokolliert

---

### 5.3 Zugriff

**KI-Agents arbeiten mit:**
- Minimalen Rechten
- Klar definiertem Kontext
- Begrenztem Scope

> Keine „Allzweck“-Admin-Agents.

---

## 6. Kontext-Regel

KI darf nur auf Kontext zugreifen, der:
- Explizit bereitgestellt wird
- Versioniert ist
- Teil der Truth Sources ist

> Kontext darf nicht implizit im Prompt „versteckt“ sein.

---

## 7. Truth-Source-Prinzip

Wahrheit entsteht durch: Spec, Policy, Node, ADR, Gate. **Nicht durch KI-Output.**

> Wenn KI im Widerspruch zur Spec steht, gilt die Spec.

---

## 8. Gate-Prinzip

KI-Änderungen müssen durch:
- Knowledge Gate
- Build
- Lint/Test-Gate (falls Code)
- Review

**Kein Merge ohne Gate.**

---

## 9. KI im Entwicklungsworkflow

### 9.1 Erlaubt
- Spec-First-Generierung
- Test-First-Generierung
- Refactoring-Vorschläge
- Runbook-Generierung
- Incident-Analyse-Assistenz
- Link-Vorschläge im Knowledge Graph
- Diff-Vorschläge für Nodes

---

### 9.2 Nicht erlaubt
- „Rewrite all specs“
- Entfernen von Sicherheits- oder Governance-Abschnitten
- Implizite Architekturänderungen
- Umgehen von Facade/Boundary-Regeln
- Selbstständige Produktionsdeployments

---

## 10. Drift-Vermeidung

**KI-Drift entsteht durch:** Implizite Regeln, fehlende Gates, unversionierten Kontext, Over-Autonomie.

**Gegenmaßnahmen:**
- Kleine Artefakte
- Präzise Links
- Diffbasierte Änderungen
- Explizite Ownership

---

## 11. Halluzinations-Management

KI-Halluzinationen sind erwartbar.

**Regeln:**
- Jede technische Aussage muss referenzierbar sein
- Jede strukturelle Änderung muss erklärbar sein
- Jede Annahme muss als Annahme markiert sein

> Wenn Unsicherheit > Klarheit → Spec erweitern, nicht raten.

---

## 12. Ownership-Prinzip

KI hat keine Ownership. Ownership liegt immer bei: menschlichem Reviewer, Modulverantwortlichem, Governance-Owner.

**KI darf Entscheidungen vorbereiten, aber nicht finalisieren.**

---

## 13. Observability für KI

KI-Aktionen müssen:
- Protokolliert sein
- Reproduzierbar sein
- Ggf. rückgängig machbar sein

> KI-Interaktion ist Teil des Systems, nicht außerhalb davon.

---

## 14. Grad der Automatisierung

Automatisierung ist erlaubt, wenn Regel klar definiert ist, Gate existiert, Reversibilität möglich ist und Security gewährleistet ist.

**Keine Vollautomatisierung ohne Safeguards.**

---

## 15. Eskalationsregel

Wenn KI-Vorschlag Security-Risiko darstellt, Governance-Regeln verletzt, Struktur verändert oder Kernarchitektur betrifft:

**→ Manuelle Review + ADR verpflichtend**

---

## 16. Erweiterbarkeit

Diese Policy ist versionierbar, anpassbar und reviewpflichtig.

> Änderungen an der KI-Policy sind Architekturentscheidungen.

---

## 17. Leitthese

KI ist Beschleuniger. Struktur ist Stabilität. Wahrheit entsteht durch Artefakte. Sicherheit entsteht durch Regeln. Governance entsteht durch explizite Entscheidungen.
