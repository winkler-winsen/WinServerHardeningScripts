# WinServerHardeningScript
Collection of PowerShell Scripts to hardening Windows Server and Windows systems

## Standard hardening
### Enable-FirewallAndLogging.ps1
Enables Windows Firewall on all profiles with logging enabled separate for each profile
### DisableFirewallRoules.ps1
Set of consumer network services to be deactivated via firewall roules
### DisableServices.ps1
Set of common consumer services to be deactivated 
### DisableTelemetry.ps1
Disable microsoft telemtry. Source [BSI SiSyPHus](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Cyber-Sicherheit/SiSyPHus/E20172000_BSI_Win10_AFUNKT_TELE_DEAKTIVIEREN_v1_0.pdf?__blob=publicationFile&v=5)

## optional server enhanced security
### DisableRDP.ps1
Disable Remotedesktop service via deactivation of services ad block firewall block roules
### FirewallBlockOutgoingRDP.ps1
Block outgoing RDP connections. May prevent miss usage as RDP jump host

## Internet Information Services (IIS)
### FixIISCrypto.ps1
IIS: Disable unsecure protocols, hash and sign algorithms and select secure cyper sets in SCHANNEL for IIS security enhancement
* disable Protocols `TLSv1.0`, `TLSv1.1`
* disable Cipher Suites `TLS_RSA*`, `*_CBC_*`,  `*_RC4_*`
* optional WebDeploy .NET upgrade TLS version
### IISCrypto33_BestPractwithBSI_TR_02102-2-CBC.ictpl
IIS: Disable unsecure protocols, hash and sign algorithms and select secure cyper sets in SCHANNEL for IIS security enhancement. Load this template file with [Nartac IIS Crypto](https://www.nartac.com/Products/IISCrypto/). Its based on template best practices with more adjustment. 
* disable Protocols `TLSv1.0`, `TLSv1.1`
* disable Hashes `MD5`, `SHA`
* disable Ciphers `DES`
* disable Cipher Suites `TLS_RSA*`, `*_SHA`, `*_CBC_*`
* enable Cipher Suites `TLS_DHE_WITH_AES_*_GCM_*`
* change DHE Key `3072` bits
