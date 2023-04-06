#!/bin/sh
isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi
  phing help "$1" >/dev/null 2>&1
}
if [ "${1#-}" != "$1" ]; then
  set -- tini -- phing "$@"
elif [ "$1" = 'phing' ]; then
  set -- tini -- "$@"
elif isCommand "$1"; then
  set -- tini -- phing "$@"
fi
exec "$@"
