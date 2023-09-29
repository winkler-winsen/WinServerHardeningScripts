$FwRoules = @(
 'PlayTo-*',
 'AllJoyn-*',
 'Microsoft-Windows-Unified-Telemetry-Client',
 'DIAL-Protocol-Server-*',
 'MDNS-*-Domain-Active',
 'WMP-*',
 'WMPNSS-*'
)

Get-NetFirewallRule -Name $FwRoules | Set-NetFirewallRule -Enabled:false -Verbose
