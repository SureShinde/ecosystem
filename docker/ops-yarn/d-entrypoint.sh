#!/bin/sh
isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi
  yarn --help "$1" >/dev/null 2>&1
}
if [ "${1#-}" != "$1" ]; then
  set -- tini -- yarn "$@"
elif [ "$1" = 'yarn' ]; then
  set -- tini -- "$@"
elif isCommand "$1"; then
  set -- tini -- yarn "$@"
fi
exec "$@"
