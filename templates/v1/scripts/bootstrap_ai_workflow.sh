#!/usr/bin/env bash
set -euo pipefail

ROOT="$(pwd)"

mkdir -p \
  "$ROOT/.github/agents" \
  "$ROOT/.github/instructions" \
  "$ROOT/scripts/gates" \
  "$ROOT/scripts/prompts" \
  "$ROOT/specs/architecture" \
  "$ROOT/specs/features/TEMPLATE" \
  "$ROOT/assets/diagrams" \
  "$ROOT/.ai_runs" \
  "$ROOT/dist"

# Minimal Constitution
cat > "$ROOT/specs/constitution.md" <<'EOF'
# Constitution (Non-Negotiables)
- Specs are the source of truth; code implements specs; code is never the spec.
- Behavioral changes require spec/plan/tasks updates (before or with code).
- Local quality gates must pass: format, lint, tests (and schema/docs if applicable).
- Reviews are spec-driven; findings are actionable (BLOCKER/MAJOR/MINOR).
EOF

# Feature Templates
cat > "$ROOT/specs/features/TEMPLATE/spec.md" <<'EOF'
# Feature Spec: TODO_FILL
## Problem
## Scope
## Non-Goals
## Behavior (externally observable)
## Invariants
## Interfaces / Boundaries
## Risks / Open Questions
## Acceptance Criteria
EOF

cat > "$ROOT/specs/features/TEMPLATE/plan.md" <<'EOF'
# Feature Plan: TODO_FILL
## Architecture Notes
## Interface / Contract Changes
## Data Model Changes
## Step-by-step Strategy
## Observability Expectations
## Test Strategy
## Risks & Mitigations
EOF

cat > "$ROOT/specs/features/TEMPLATE/tasks.md" <<'EOF'
# Feature Tasks: TODO_FILL
## Task List

### T-001 — TODO_FILL
- Status: TODO
- Goal: TODO_FILL
- Dependencies: None
- Acceptance Criteria:
  - TODO_FILL
- Required Tests:
  - TODO_FILL
- Likely Areas/Files:
  - TODO_FILL
EOF

cat > "$ROOT/specs/features/TEMPLATE/review.md" <<'EOF'
# Feature Review: TODO_FILL
## Summary
## Findings
## Missing Tests / Docs
## Follow-ups
EOF

# Gates (Node + PHP aware)
cat > "$ROOT/scripts/gates/format.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "== FORMAT gate =="
RET=0

# Node (Prettier)
if [ -f package.json ]; then
  if npm run | grep -q "format:check"; then
    npm run format:check || RET=1
  elif npx --yes prettier --version >/dev/null 2>&1; then
    npx prettier -c . || RET=1
  else
    echo "Hint: add Prettier or npm script 'format:check'"
  fi
fi

# PHP (php-cs-fixer or PHP_CodeSniffer)
if [ -f composer.json ]; then
  if composer --no-interaction --no-progress info | grep -q "friendsofphp/php-cs-fixer"; then
    vendor/bin/php-cs-fixer fix --dry-run --diff . || RET=1
  elif composer --no-interaction --no-progress info | grep -q "squizlabs/php_codesniffer"; then
    vendor/bin/phpcbf . || true
    vendor/bin/phpcs --standard=PSR12 . || RET=1
  else
    echo "Hint: require-dev php-cs-fixer or squizlabs/php_codesniffer"
  fi
fi

exit $RET
EOF

cat > "$ROOT/scripts/gates/lint.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "== LINT gate =="
RET=0

# Node (ESLint)
if [ -f package.json ]; then
  if npm run | grep -q "lint"; then
    npm run lint || RET=1
  elif npx --yes eslint -v >/dev/null 2>&1; then
    npx eslint . || RET=1
  else
    echo "Hint: add ESLint or npm script 'lint'"
  fi
fi

# PHP (PHPCS / PHPStan / Psalm)
if [ -f composer.json ]; then
  if [ -x vendor/bin/phpcs ]; then
    vendor/bin/phpcs --standard=PSR12 . || RET=1
  fi
  if [ -x vendor/bin/phpstan ]; then
    vendor/bin/phpstan analyse || RET=1
  elif [ -x vendor/bin/psalm ]; then
    vendor/bin/psalm || RET=1
  else
    echo "Hint: require-dev phpstan/phpstan or vimeo/psalm for static analysis"
  fi
fi

exit $RET
EOF

cat > "$ROOT/scripts/gates/test.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
echo "== TEST gate =="
RET=0

# Node tests (Jest/Mocha/Vitest)
if [ -f package.json ]; then
  if npm run | grep -q "test"; then
    npm test || RET=1
  elif npx --yes jest -v >/dev/null 2>&1; then
    npx jest --ci || RET=1
  elif npx --yes vitest --version >/dev/null 2>&1; then
    npx vitest run || RET=1
  else
    echo "Hint: add a test runner (Jest/Vitest/Mocha) and npm script 'test'"
  fi
fi

# PHP tests (PHPUnit)
if [ -f composer.json ]; then
  if [ -x vendor/bin/phpunit ]; then
    vendor/bin/phpunit --colors=never || RET=1
  else
    echo "Hint: require-dev phpunit/phpunit and create phpunit.xml"
  fi
fi

exit $RET
EOF

chmod +x "$ROOT/scripts/gates/"*.sh

# Repo-wide Copilot instructions (stub)
cat > "$ROOT/.github/copilot-instructions.md" <<'EOF'
# Copilot Instructions (Repo-wide)
- Follow specs/constitution.md (Specs → Code, not the other way).
- Prefer small, reviewable diffs.
- AUTOMATION MODE: output ONLY unified diff between [BEGIN PATCH] and [END PATCH].
EOF

echo "✅ Bootstrap complete."
echo "Next:"
echo "1) Copy specs/features/TEMPLATE to specs/features/<feature> and fill spec/plan/tasks."
echo "2) Wire Node & PHP dev tooling (package.json / composer.json)."
echo "3) Run gates: scripts/gates/format.sh && scripts/gates/lint.sh && scripts/gates/test.sh"
