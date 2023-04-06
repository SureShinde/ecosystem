#!/bin/sh
isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi
  grunt --help "$1" >/dev/null 2>&1
}
if [ "${1#-}" != "$1" ]; then
  set -- tini -- grunt "$@"
elif [ "$1" = 'grunt' ]; then
  set -- tini -- "$@"
elif isCommand "$1"; then
  set -- tini -- grunt "$@"
fi
exec "$@"
