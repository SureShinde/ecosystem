#!/bin/bash
set -e

directory="/etc/supervisor"

while IFS= read -r file; do

  for e in "${!SUPERVISOR_@}"; do

      sed -i -e 's!__'"$e"'__!'"$(printenv "$e")"'!g' "$file"

  done

done < <(find "$directory" -name "*.conf")

(>&2 echo "[*] Bootstrap SUPERVISOR")
