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
