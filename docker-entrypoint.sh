#!/usr/bin/env sh

[ "$1" = "update" ] || exec "$@" || exit $?

echo "Hello World"

IP=$(curl --ipv4 -s http://icanhazip.com/)


echo "IP $IP"
echo "TOKEN $TOKEN"
echo "ACCOUNT_ID $ACCOUNT_ID"
echo "ZONE_ID $ZONE_ID"
echo "RECORD_ID $RECORD_ID"
echo "URL  https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID "
echo "Sending..."

curl -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -X "PATCH" \
     -i "https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID" \
     -d "{\"content\":\"$IP\"}"

echo "Done"