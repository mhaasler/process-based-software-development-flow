#!/usr/bin/env bash
set -euo pipefail

node scripts/validate_knowledge.mjs
node build.mjs

echo "OK: knowledge gate passed (validated + built)."
