#!/bin/sh
isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi
  symfony --help "$1" >/dev/null 2>&1
}
if [ "${1#-}" != "$1" ]; then
  set -- tini -- symfony "$@"
elif [ "$1" = 'symfony' ]; then
  set -- tini -- "$@"
elif isCommand "$1"; then
  set -- tini -- symfony "$@"
fi
exec "$@"
