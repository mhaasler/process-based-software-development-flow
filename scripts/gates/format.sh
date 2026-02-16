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
