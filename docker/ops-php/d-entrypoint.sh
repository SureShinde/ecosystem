#!/bin/sh
isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi
  php help "$1" >/dev/null 2>&1
}
if [ "${1#-}" != "$1" ]; then
  set -- tini -- php "$@"
elif [ "$1" = 'php' ]; then
  set -- tini -- "$@"
elif isCommand "$1"; then
  set -- tini -- php "$@"
fi
exec "$@"
