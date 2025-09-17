$ssid = Read-Host "Enter your trusted SSID"
$ipPrefix = Read-Host "Enter your trusted IP prefix (e.g., 192.168.1.)"
$email = Read-Host "Enter your alert email address"
$sms = Read-Host "Enter your SMS gateway address (e.g., 1234567890@vtext.com)"
$appPass = Read-Host "Enter your email app password"

$config = @"
SSID=$ssid
IP_PREFIX=$ipPrefix
EMAIL=$email
SMS_GATEWAY=$sms
APP_PASSWORD=$appPass
"@

$config | Out-File "$env:USERPROFILE\Documents\ghosttech_config.txt" -Encoding UTF8
Write-Host "Config saved to Documents folder."