#!/usr/bin/env sh

[ "$1" = "update" ] || exec "$@" || exit $?

URL = "https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID"
while [ : ]
do
     now="$(date +"%r")"
     IP=$(curl --ipv4 -s http://icanhazip.com/)
     printf "\n$now\t-\t$IP\t-\t$URL\n"

     curl -H "Authorization: Bearer $TOKEN" \
          -H "Content-Type: application/json" \
          -H "Accept: application/json" \
          -X "PATCH" \
          $URL \
          -d "{\"content\":\"$IP\"}" \ 

     sleep $SLEEP_DELAY
done
