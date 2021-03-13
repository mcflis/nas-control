#!/usr/bin/env bash
set -e

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "$OSTYPE is not supported"
  exit 1
fi

USER=${IPMI_USER-ADMIN}
PASS=${IPMI_PASSWORD-$(cat ~/.credentials/ipmi)}
HOST=${IPMI_HOST}
cookie_jar=cookies.txt
base64_data="name=$(echo -n "$USER" | openssl base64)&pwd=$(echo -n "$PASS" | openssl base64)&check=00"

prefix=$(basename "$0")
tmpdir=$(mktemp -dt "$prefix")
pushd "$tmpdir"
curl -s -H "Content-Type: application/x-www-form-urlencoded" -d "$base64_data" -c "$cookie_jar" "https://$HOST/cgi/login.cgi" >/dev/null
curl -s -b "$cookie_jar" "https://$HOST/cgi/url_redirect.cgi?url_name=ikvm&url_type=jwsk" -o "$HOST.jviewer.jnlp"
chmod -R u=rwX,go-rwx ./*
open "$HOST.jviewer.jnlp"
ls -lah .
popd
