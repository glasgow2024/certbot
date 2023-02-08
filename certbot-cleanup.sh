#!/bin/bash

ZONEFILE="/var/named/${CERTBOT_DOMAIN}.zone"

export ZONEFILE && ./certbot-serial.sh

#DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')

sed -i "/$CERTBOT_VALIDATION/d" /var/named/${CERTBOT_DOMAIN}.zone
systemctl restart named
