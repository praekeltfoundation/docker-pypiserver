#!/usr/bin/env sh
if [ -f /.htpasswd ]; then
  PASSWORDS_OPT="--passwords /.htpasswd"
fi

exec pypi-server $PASSWORDS_OPT /packages/
