#!/bin/bash
set -e

(>&2 echo "[*] Bootstrap SYMFONY")

if [ -n "$(ls -A /var/www/migrations/*.php 2>/dev/null)" ]; then

  until bin/console doctrine:query:sql "select 1" >/dev/null 2>&1; do

    (echo >&2 "Waiting for MySQL to be ready...")

    sleep 1

  done

  bin/console doctrine:migrations:migrate --no-interaction

fi

(>&2 echo "[*] Bootstrap DOCTRINE MIGRATION")
