#!/bin/zsh
CONFIG="$HOME/ghosttech_config.txt"
SSID=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')
IP=$(ipconfig getifaddr en0)
source <(grep = "$CONFIG")

if [[ "$SSID" != "$SSID" || "$IP" != "$IP_PREFIX"* ]]; then
    sudo launchctl bootout system /System/Library/LaunchDaemons/ssh.plist
    echo "Breach detected: $SSID / $IP" >> "$HOME/ghosttech_log.txt"
    echo "Subject: Unauthorized Access" | sendmail "$EMAIL"
    echo "Subject: Unauthorized Access" | sendmail "$SMS_GATEWAY"
fi