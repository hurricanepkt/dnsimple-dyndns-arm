#!/usr/bin/env sh

[ "$1" = "update" ] || exec "$@" || exit $?


while [ : ]
do
     REQUEST_URL="https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID"
     now="$(date +"%r")"
     IP=$(curl --ipv4 -s http://icanhazip.com/)
     printf "\n$now\t-\t$IP\t-\t$REQUEST_URL\n"

     curl -H "Authorization: Bearer $TOKEN" \
          -H "Content-Type: application/json" \
          -H "Accept: application/json" \
          -X "PATCH" \
          $REQUEST_URL \
          -d "{\"content\":\"$IP\"}" \ 

     sleep $SLEEP_DELAY
done
