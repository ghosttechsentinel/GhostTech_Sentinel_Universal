#!/bin/bash
read -p "Enter your trusted SSID: " ssid
read -p "Enter your trusted IP prefix (e.g., 192.168.1.): " ip_prefix
read -p "Enter your alert email address: " email
read -p "Enter your SMS gateway address (e.g., 1234567890@vtext.com): " sms
read -p "Enter your email app password: " app_pass

cat <<EOF > "$HOME/ghosttech_config.txt"
SSID=$ssid
IP_PREFIX=$ip_prefix
EMAIL=$email
SMS_GATEWAY=$sms
APP_PASSWORD=$app_pass
EOF

echo "Config saved to $HOME/ghosttech_config.txt"