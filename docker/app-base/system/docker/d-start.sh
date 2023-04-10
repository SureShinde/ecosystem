#!/bin/bash
set -e

(>&2 echo "[*] Start")

while IFS= read -r script; do

  if [ -f "$script" ]; then

    bash "$script" "$@"

  fi

done < <(grep -v '^ *#' < '/docker/d-start.list')
