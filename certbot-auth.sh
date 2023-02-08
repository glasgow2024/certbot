#!/bin/bash

echo Domain: $CERTBOT_DOMAIN
echo Validation: $CERTBOT_VALIDATION
ZONEFILE="/var/named/${CERTBOT_DOMAIN}.zone"

export ZONEFILE && ./certbot-serial.sh

# Strip only the top domain to get the zone id
# DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')
# echo Top level domain: $DOMAIN

echo sed -i "$ a _acme-challenge IN    TXT     \"$CERTBOT_VALIDATION\"" $ZONEFILE
sed -i "$ a _acme-challenge IN    TXT     \"$CERTBOT_VALIDATION\"" $ZONEFILE
systemctl restart named
sleep 5

