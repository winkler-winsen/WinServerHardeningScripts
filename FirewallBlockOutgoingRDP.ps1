# Better to put this in GPO
New-NetFirewallRule -DisplayName "Block Outgoing Remote Desktop Connection" -Direction Outbound -Program "%windir%\system32\mstsc.exe" -Action Block -Description "Block outgoing RDP Sessions by mstsc.exe"
