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
