# Copilot Instructions (Repo-wide)
# Scope: All contributions (knowledge, specs, code)

## Non-negotiables
- Truth lives in versioned artifacts (Markdown/YAML) and code. Never in chat logs.
- All outputs must be diff-ready: propose concrete file edits or patches, not only prose.
- Never bypass gates. If you change knowledge artifacts, ensure build/validation is run.
- Keep text minimal: prefer guardrails + failure-modes over long explanations.

## Safety & Security
- Never output or request secrets/credentials.
- Never introduce steps that copy secrets into repos, logs, tickets, or chat.
- For code execution or risky tooling, require sandboxing/isolation by default.
- Prefer least-privilege and time-bounded access patterns.

## Specs & Policies
- Specs/policies are normative. Code must implement specs; code is never the spec.
- If a change impacts architecture/policies, propose an ADR or policy diff first.

## Link & Structure Discipline
- Avoid overlinking. Add only 2–6 load-bearing links per node/change.
- Maintain layer discipline: Core/Process/Governance vs subsystem vs detail nodes.
- Do not rename node ids casually. Renames require migration plan + link updates.

## Output Format
- Provide: (1) what files to change (2) exact content (3) commands to run gates.
- Prefer deterministic scripts over manual steps.
