#!/bin/sh
isCommand() {
  if [ "$1" = "sh" ]; then
    return 1
  fi
  composer help "$1" >/dev/null 2>&1
}
if [ "$COMPOSER_AUTH" != "" ]; then
  echo "$COMPOSER_AUTH" > /src/auth.json
fi
if [ "${1#-}" != "$1" ]; then
  set -- tini -- composer "$@"
elif [ "$1" = 'composer' ]; then
  set -- tini -- "$@"
elif isCommand "$1"; then
  set -- tini -- composer "$@"
fi
exec "$@"
