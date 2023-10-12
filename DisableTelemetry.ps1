﻿# Source: https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Cyber-Sicherheit/SiSyPHus/E20172000_BSI_Win10_AFUNKT_TELE_DEAKTIVIEREN_v1_0.pdf?__blob=publicationFile&v=5

# Tabelle 1: Schritt 1: Deaktivierung der Benutzererfahrung und Telemetrie im Verbund Modus
Get-Service -Name "DiagTrack" | Stop-Service -PassThru | Set-Service -StartupType Disabled -Verbose

# Tabelle 2: Schritt 2: Deaktivierung der Diagtrack-Autologger Session
# Tabelle 3: Schritt 3: Löschen der Autologger Logdatei falls vorhanden
Remove-Item "$($env:systemroot)\System32\LogFiles\WMI\Diagtrack-Listener.etl*" -Verbose