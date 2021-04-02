#!/usr/bin/env sh

[ "$1" = "update" ] || exec "$@" || exit $?


while [ : ]
do
     REQUEST_URL="https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID"
     now="$(date +"%r")"
     IP=$(curl --ipv4 -s http://icanhazip.com/)
     printf "$now\t-\t$IP\t-\t$REQUEST_URL\t-\t"

     curl -H "Authorization: Bearer $TOKEN" \
          -H "Content-Type: application/json" \
          -H "Accept: application/json" \
          -s \
          -X "PATCH" \
          $REQUEST_URL \
          -d "{\"content\":\"$IP\"}" \ 
     printf "\n"
     sleep $SLEEP_DELAY
done
