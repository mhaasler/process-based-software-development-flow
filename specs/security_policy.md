# Security & Safety Policy (Enforceable)

**Version 1.0 – Baseline**

---

## 1. Zweck

Diese Policy definiert durchsetzbare Sicherheitsregeln für:
- Secrets & Credentials
- Zugriff (Least Privilege)
- Sandboxing/Isolation
- Supply Chain
- Datenschutz/PII
- Logging/Telemetry
- Security Incident Response

**Ziel:** Security ist „by design“ und gate-fähig — nicht Checkliste oder Meeting-Thema.

---

## 2. Geltungsbereich

Gilt für alle Artefakte und Systeme in diesem Projektkontext (Specs, Knowledge, Code, Tooling, KI-Workflows).

> Bei Konflikt gilt: **Constitution > Policies > Specs > Knowledge > Code.**

---

## 3. Non-Negotiables

1. **Keine Secrets** in Git, Logs, Tickets oder Chats.
2. **Default Deny** für Ausführung (keine Netze, keine produktiven Daten ohne Erlaubnis).
3. **Least Privilege**: Minimaler Scope, zeitlich begrenzt, auditierbar.
4. **PII/Privacy**: Datenminimierung und explizite Löschfristen.
5. **Gates** sind Pflicht für sicherheitsrelevante Änderungen.

---

## 4. Secrets & Credential Management

### 4.1 Speicherort & Zugriff
- Secrets werden ausschließlich in einem genehmigten Secret-Store verwaltet.
- Zugriff nur rollenbasiert; keine „shared admin credentials“.

### 4.2 Ausgabe & Verarbeitung
- Keine Secrets in Klartext ausgeben.
- Keine Secrets in `.env` committen.
- Wenn `.env` genutzt wird: nur `.env.example` ohne Werte.

### 4.3 Rotation & Revocation
- Für produktive oder geteilte Secrets existiert ein Rotationsplan.
- Bei Verdacht auf Leak: sofort Revocation + Rotation.

### 4.4 KI-Regel
- KI darf niemals Secrets sehen oder anfordern.
- KI-Outputs dürfen keine echten Tokens/Keys enthalten.

---

## 5. Zugriff & Least Privilege

### 5.1 Tokens/Keys
- Prefer: kurzlebige Tokens, scoped, timeboxed.
- „Forever tokens“ sind verboten, außer dokumentierte Ausnahme.

### 5.2 Rollenmodell
- Mindestens drei Rollen: **read-only, contributor, admin**.
- Admin ist nur „break glass“ und auditpflichtig.

### 5.3 Auditability
- Jede privilegierte Aktion muss nachvollziehbar sein.
- Fehlende technische Auditlogs müssen als Risiko dokumentiert werden.

---

## 6. Sandboxing & Isolation

### 6.1 Pflicht-Isolation
Alle folgenden Dinge laufen isoliert:
- KI-generierte Codeausführung
- Untrusted Inputs (Uploads, externe Daten)
- Imports/Dependencies, die dynamisch geladen werden
- Tools mit Dateisystem-/Netzwerkzugriff

### 6.2 Default Limits
Ein Sandbox-Profil MUSS definieren:
- CPU/Memory Limits
- File system: Read-only Standard, explizite Mounts
- Netzwerk: Off by default; Allowlist
- Secrets: No mounts by default
- Prozessrechte: Non-root

### 6.3 Logging in Sandbox
- Sandbox-Logs dürfen keine Secrets/PII enthalten.
- Korrelation IDs erlaubt, aber keine personenbezogenen Identifikatoren.

---

## 7. Supply Chain Security

### 7.1 Pinning
- Lockfiles sind Pflicht.
- Versionen „latest“ ohne Pinning sind verboten.

### 7.2 Verifikation
- Wenn möglich: Signaturen/Checksums prüfen.

### 7.3 Gate
- Dependency-Änderungen sind security-relevant (Change Type CT4).
- Mindestens: Review + Test/Build Gate.

---

## 8. Datenschutz & Datenhandling (PII)

### 8.1 Datenklassifikation
Daten sind zu klassifizieren: Public, Internal, Sensitive, PII, Secrets.

### 8.2 Data Minimization
- Nur speichern, was benötigt wird.
- Retention/Deletion muss definiert sein.

---

## 9. Logging & Telemetry Security

### 9.1 Allowlist statt Denylist
- Logging folgt Allowlist-Prinzip.
- Sensitive Felder sind verboten.

### 9.2 Korrelation
- Keine IDs, die Personen direkt identifizieren in Logs/Traces.

---

## 10. Security Incidents & Response

### 10.1 Incident Flow
Detection → Containment → Rotation → Recovery → Postmortem → Policy Update.

### 10.2 Pflichtartefakte
- Incident Record (kurz), Actions (Owner, Deadline).
- Learnings werden zwingend in Policies/Gates überführt.

---

## 11. Exceptions (Abweichungen)

Ausnahmen erfordern ein explizites Artefakt mit Kontext, Scope, Timebox, Mitigation, Owner und Exit-Plan. Security Exceptions sind immer CT4.

---

## 12. Enforcements & Gates (Minimum)

### 12.1 Gate Trigger
Ein Security Gate ist Pflicht bei Änderungen an Dependencies, Secret Handling, Sandboxing oder Access Control.

### 12.2 Minimum Checks
- Keine Secrets im Diff, keine PII in Logs, gepinnte Dependencies.

---

## 13. KI-spezifische Regeln

KI arbeitet nur über diffbare Artefakte, darf keine Secrets sehen und läuft isoliert. Änderungen passieren Gate + Review. Verweis: `specs/ai_policy.md`.

---

## 14. Revisionsregel

Änderungen an dieser Policy sind normativ (CT2) und reviewpflichtig.

---

## 15. Leitthese

> Security ist ein Systemdesign-Problem. Wenn Security nicht durch Artefakte und Gates erzwungen wird, existiert sie nicht.
