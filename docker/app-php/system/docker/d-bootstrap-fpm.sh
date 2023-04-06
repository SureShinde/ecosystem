#!/bin/bash
set -e

(>&2 echo "[*] Bootstrap FPM")

directory="/etc/php/$PHP_VERSION/fpm"

while IFS= read -r file; do

  for e in "${!FPM_@}"; do

      sed -i -e 's!__'"$e"'__!'"$(printenv "$e")"'!g' "$file"

  done

done < <(find "$directory" -name "*.conf")
