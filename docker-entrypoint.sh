#!/usr/bin/env sh

[ "$1" = "update" ] || exec "$@" || exit $?


IP=$(curl --ipv4 -s http://icanhazip.com/)

curl -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -X "PATCH" \
     -i "https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID" \
     -d "{\"content\":\"$IP\"}"