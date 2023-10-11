#
# Disable unnessecary services
# 
$Services = @(
  "InstallService",
  "Spooler",              # Druckwarteschlange
#  "Browser",              # Browser (breaks RDP server with NLA error and Test-ComputerSecureChannel)
  "WPDBusEnum",           # Enumeratordienst für tragbare GerÃ¤te
  "fdPHost",              # Funktionssuchanbieter-Host
  "ShellHWDetection",     # Shellhardwareerkennung
  "TrkWks",               # Überwachung verteilter Verknüpfungen (Client)
  "bthserv",              # Bluetooth-Unterstützungsdienst
  "NcbService",           # Netzwerkverbindungsbroker
  "SensrSvc",             # Sensorüberwachungsdienst
  "WiaRpc",               # Ereignisse zum Abrufen von Standbildern
  "upnphost",             # UPnP-Gerätehost
  "AudioEndpointBuilder", # Windows-Audio-Endpunkterstellung
#  "LanmanServer",         # Server / SMB Server
  "DiagTrack",         # Diagnostics Tracking Service (Telemetry)
  "FrameServer"           # Windows-Kamera-FrameServer
)

foreach ($Service in $Services) {
  Get-Service $Service | Set-Service -StartupType Disabled -Verbose
}
