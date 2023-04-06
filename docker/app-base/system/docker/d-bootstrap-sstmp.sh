#!/bin/bash
set -e

directory="/etc/ssmtp"

while IFS= read -r file; do

  for e in "${!SSTMP_@}"; do

      sed -i -e 's!__'"$e"'__!'"$(printenv "$e")"'!g' "$file"

  done

done < <(find "$directory" -name "*.conf")

(>&2 echo "[*] Bootstrap SSTMP")
