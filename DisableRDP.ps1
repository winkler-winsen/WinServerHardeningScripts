# Disabling Remotedesktop Services (RDP)
New-NetFirewallRule -DisplayName "RDP Block In TCP 3389" -Direction Inbound -Action Block -Protocol TCP -LocalPort 3389 -Group "Remotedesktop"
New-NetFirewallRule -DisplayName "RDP Block In UDP 3389" -Direction Inbound -Action Block -Protocol UDP -LocalPort 3389 -Group "Remotedesktop"
Get-Service -Name ('TermService', 'UmRdpService') | Set-Service -StartupType Disabled -PassThru -Verbose | Stop-Service -Force -Verbose
