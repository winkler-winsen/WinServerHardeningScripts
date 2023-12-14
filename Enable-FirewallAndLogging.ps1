Set-NetFirewallProfile `
    -Profile Domain,Public,Private `
    -Enabled True
# Source https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure-with-command-line?tabs=powershell
Set-NetFirewallProfile `
    -DefaultInboundAction Block `
    -DefaultOutboundAction Allow `
    -NotifyOnListen True `
    -AllowUnicastResponseToMulticast True `
    -LogFileName %SystemRoot%\System32\LogFiles\Firewall\pfirewall.log `
    -LogMaxSizeKilobytes 20480 

# Source https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/configure-logging?tabs=intune#recommendations
Set-NetFirewallProfile `
    -Profile Domain `
    -LogFileName %SystemRoot%\System32\LogFiles\Firewall\pfirewall_Domain.log
Set-NetFirewallProfile `
    -Profile Private `
    -LogFileName %SystemRoot%\System32\LogFiles\Firewall\pfirewall_Private.log
Set-NetFirewallProfile `
    -Profile Public `
    -LogFileName %SystemRoot%\System32\LogFiles\Firewall\pfirewall_Public.log
