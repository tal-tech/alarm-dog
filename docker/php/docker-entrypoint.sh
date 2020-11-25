#!/bin/bash
set -eo pipefail
shopt -s nullglob

cd /opt/www

[ ! -d vendor ] && composer install --no-dev && php bin/hyperf.php list

if [ "$1" != "php" ]; then
  php bin/hyperf.php start
fi
exec "$@"
