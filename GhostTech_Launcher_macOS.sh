#!/bin/zsh
read "ssid?Enter your trusted SSID: "
read "ip_prefix?Enter your trusted IP prefix (e.g., 192.168.1.): "
read "email?Enter your alert email address: "
read "sms?Enter your SMS gateway address (e.g., 1234567890@vtext.com): "
read "app_pass?Enter your email app password: "

cat <<EOF > "$HOME/ghosttech_config.txt"
SSID=$ssid
IP_PREFIX=$ip_prefix
EMAIL=$email
SMS_GATEWAY=$sms
APP_PASSWORD=$app_pass
EOF

echo "Config saved to $HOME/ghosttech_config.txt"