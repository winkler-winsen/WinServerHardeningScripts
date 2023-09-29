#
# Disable unnessecary services
# 
$Services = @(
  "InstallService",
  "Spooler",              # Druckwarteschlange
  "Browser",              # Browser
  "WPDBusEnum",           # Enumeratordienst fÃ¼r tragbare GerÃ¤te
  "fdPHost",              # Funktionssuchanbieter-Host
  "ShellHWDetection",     # Shellhardwareerkennung
  "TrkWks",               # Ãœberwachung verteilter VerknÃ¼pfungen (Client)
  "bthserv",              # Bluetooth-UnterstÃ¼tzungsdienst
  "NcbService",           # Netzwerkverbindungsbroker
  "SensrSvc",             # SensorÃ¼berwachungsdienst
  "WiaRpc",               # Ereignisse zum Abrufen von Standbildern
  "upnphost",             # UPnP-GerÃ¤tehost
  "AudioEndpointBuilder", # Windows-Audio-Endpunkterstellung
  "FrameServer"           # Windows-Kamera-FrameServer
)

foreach ($Service in $Services) {
  Get-Service $Service | Set-Service -StartupType Disabled -Verbose
}
