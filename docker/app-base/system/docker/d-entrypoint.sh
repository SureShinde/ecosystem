#!/bin/bash
set -e

if [ "$1" = 'supervisord' ]; then

  (>&2 echo "Run docker entrypoint")

  while IFS= read -r script; do

    if [ -f "$script" ]; then

      bash "$script" "$@"

    fi

  done < <(grep -v '^ *#' < '/docker/d-entrypoint.list')

fi

exec "$@"
