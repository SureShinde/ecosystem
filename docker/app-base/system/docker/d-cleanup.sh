#!/bin/bash
set -e

(>&2 echo "[*] Cleanup")

while IFS= read -r script; do

  if [ -f "$script" ]; then

    bash "$script" "$@"

  fi

done < <(grep -v '^ *#' < '/docker/d-cleanup.list')
