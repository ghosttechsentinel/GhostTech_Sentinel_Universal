$config = Get-Content "$env:USERPROFILE\Documents\ghosttech_config.txt" | ForEach-Object {
    $kv = $_ -split '='; @{ ($kv[0]) = $kv[1] }
} | Merge-Dictionary

$ssid = netsh wlan show interfaces | Select-String 'SSID' | Select-Object -First 1
$ip = (Get-NetIPAddress -AddressFamily IPv4).IPAddress

if ($ssid -notmatch $config['SSID'] -or $ip -notmatch $config['IP_PREFIX']) {
    Disable-PSRemoting
    Send-MailMessage -To $config['EMAIL'], $config['SMS_GATEWAY'] -Subject "Unauthorized Access" -Body "SSID/IP mismatch detected." -SmtpServer "smtp.gmail.com" -Port 587 -UseSsl -Credential (New-Object PSCredential $config['EMAIL'], (ConvertTo-SecureString $config['APP_PASSWORD'] -AsPlainText -Force))
    Add-Content "$env:USERPROFILE\Documents\ghosttech_log.txt" "$(Get-Date): Breach detected"
}