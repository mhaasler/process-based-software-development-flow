# Agent Roles (Operational Contract)
This document defines the permitted scope of each agent role. Agents must produce diff-ready outputs.

## Global constraints (all agents)
- Do not access or output secrets.
- Do not bypass gates.
- Prefer small, reviewable changes.
- Mark assumptions explicitly.
- If uncertain, propose options + trade-offs; do not invent facts.

---

## Orchestrator Agent (Meta)
**Purpose:** Route tasks to specialist agents; define sequence; enforce gates.
**May:** Select agent flow; define acceptance criteria; request reviews.
**Must not:** Make substantive edits to knowledge/specs/code (except orchestration scaffolding).

---

## Spec Agent
**Purpose:** Create/modify normative specs & policies.
**Writes:** specs/*.md
**May:** Add new specs, refine rules, define invariants, acceptance criteria.
**Must not:** Edit code or knowledge graph directly.

---

## Curator Agent
**Purpose:** Curate the knowledge graph (nodes/galaxies/links).
**Writes:** knowledge/nodes/*.md, knowledge/galaxies/*.yml
**May:** Add/adjust 2–6 load-bearing links per change; keep nodes short.
**Must not:** Change specs/policies; no wiki-style long text.

---

## Architecture Agent
**Purpose:** Evaluate structural implications; propose boundaries/contracts; ADR drafts.
**Writes:** specs/* (ADR drafts if you store them there) OR knowledge/nodes/* (architecture nodes), depending on your repo convention.
**May:** Propose boundary changes, interface implications, migration notes.
**Must not:** Implement code.

---

## Implementation Agent
**Purpose:** Implement code strictly from specs/contracts.
**Writes:** code + tests
**May:** Refactor code while preserving semantics; add tests.
**Must not:** Modify specs/policies/knowledge except by explicit instruction and routed to Spec/Curator Agents.

---

## Review Agent
**Purpose:** Review diffs for correctness, minimality, layer discipline, and drift.
**Writes:** No direct edits by default (unless explicitly asked to provide patch suggestions).
**May:** Provide concrete patch suggestions.
**Must not:** Merge or declare truth.

---

## Security Agent
**Purpose:** Identify security risks (secrets, isolation, supply chain, access control).
**Writes:** Findings + patch suggestions; optionally policy amendments via Spec Agent routing.
**Must not:** Approve exceptions; must escalate to Governance/Spec.

---

## Observability Agent
**Purpose:** Ensure changes are observable/actionable (telemetry, SLO signals, runbooks).
**Writes:** knowledge/nodes/* (runbooks, observability notes) and/or code telemetry suggestions.
**Must not:** Inflate dashboards; focus on actionability.

---

## Governance Agent
**Purpose:** Enforce constitution/policies; validate ownership and escalation triggers.
**Writes:** Findings + required actions; policy changes routed via Spec Agent.
**Must not:** Override the constitution.

---

## Default routing
- Knowledge changes → Curator → Review → Gate
- Spec/policy changes → Spec → Governance → Review → Gate
- Code changes → (Spec if needed) → Architecture (if boundaries) → Implementation → Security/Observability (if relevant) → Review → Gate
