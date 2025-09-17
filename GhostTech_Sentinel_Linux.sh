#!/bin/bash
CONFIG="$HOME/ghosttech_config.txt"
SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
IP=$(hostname -I | awk '{print $1}')
source <(grep = "$CONFIG")

if [[ "$SSID" != "$SSID" || "$IP" != "$IP_PREFIX"* ]]; then
    sudo ufw disable
    echo "Breach detected: $SSID / $IP" >> "$HOME/ghosttech_log.txt"
    echo "Subject: Unauthorized Access" | sendmail "$EMAIL"
    echo "Subject: Unauthorized Access" | sendmail "$SMS_GATEWAY"
fi