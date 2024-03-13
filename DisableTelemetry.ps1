# Source: https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Cyber-Sicherheit/SiSyPHus/E20172000_BSI_Win10_AFUNKT_TELE_DEAKTIVIEREN_v1_0.pdf?__blob=publicationFile&v=5

# Tabelle 1: Schritt 1: Deaktivierung der Benutzererfahrung und Telemetrie im Verbund Modus
Get-Service -Name "DiagTrack" | Stop-Service -PassThru | Set-Service -StartupType Disabled -Verbose

# Tabelle 2: Schritt 2: Deaktivierung der Diagtrack-Autologger Session
Get-AutologgerConfig -Name "Diagtrack-Listener" | Set-AutologgerConfig -Start 0 -Verbose
# Tabelle 3: Schritt 3: Löschen der Autologger Logdatei falls vorhanden
Remove-Item "$($env:systemroot)\System32\LogFiles\WMI\Diagtrack-Listener.etl*" -Verbose

# Tabelle 4: Konfiguration des niedrigst möglichen Telemetrie-Levels
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection\ -name AllowTelemetry -Value 0 -Verbose

# Tabelle 5: Windows Defender Firewall Regel zum Blockieren der vordefinierten Verbindung
Set-NetFirewallRule -Name Microsoft-Windows-Unified-Telemetry-Client -Enabled:true -Action:block

# Tabelle 6: Windows Defender Firewall Regel zum Blockieren der Telemetrie
New-NetFirewallRule -DisplayName "BlockDiagTrackService" -Name "BlockDiagTrackService" -Direction Outbound -Service "DiagTrack" -Action Block -Verbose

# Tabelle 7: Windows Defender Firewall Regel zum Blockieren des duplizierten Telemetrie-Diensts
New-NetFirewallRule -DisplayName "BlockDiagTrack" -Name "BlockDiagTrack" -Direction Outbound -Program "%SystemRoot%\System32\utc_myhost.exe" -Action Block -Verbose
