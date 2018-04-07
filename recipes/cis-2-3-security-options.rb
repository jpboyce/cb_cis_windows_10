# Windows 10 CIS Benchmark Items - Section 2.3 - Security Options

# 2.3.1.1 (L1) Ensure 'Accounts: Administrator account status' is set to 'Disabled'

# 2.3.1.2 (L1) Ensure 'Accounts: Block Microsoft accounts' is set to 'Users can't add or log on with Microsoft accounts'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: NoConnectedUser
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'NoConnectedUser',
    type: :dword,
    data: 3,
  }]
  action :create
end

# 2.3.1.3 (L1) Ensure 'Accounts: Guest account status' is set to 'Disabled'

# 2.3.1.4 (L1) Ensure 'Accounts: Limit local account use of blank passwords to console logon only' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:LimitBlankPasswordUse
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'LimitBlankPasswordUse',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.1.5 (L1) Configure 'Accounts: Rename administrator account'

# 2.3.1.6 (L1) Configure 'Accounts: Rename guest account'

# 2.3.2.1 (L1) Ensure 'Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:SCENoApplyLegacyAuditPolicy
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'SCENoApplyLegacyAuditPolicy',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.2.2 (L1) Ensure 'Audit: Shut down system immediately if unable to log security audits' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:CrashOnAuditFail
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'CrashOnAuditFail',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.4.1 (L1) Ensure 'Devices: Allowed to format and eject removable media' is set to 'Administrators and Interactive Users'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon:AllocateDASD
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' do
  values [{
    name: 'AllocateDASD',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.4.2 (L2) Ensure 'Devices: Prevent users from installing printer drivers' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers:AddPrinterDrivers
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers' do
  values [{
    name: 'AddPrinterDrivers',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.6.1 (L1) Ensure 'Domain member: Digitally encrypt or sign secure channel data (always)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters:RequireSignOrSeal
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters' do
  values [{
    name: 'RequireSignOrSeal',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.6.2 (L1) Ensure 'Domain member: Digitally encrypt secure channel data (when possible)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters:Seal SecureChannel
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters' do
  values [{
    name: 'SealSecureChannel',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.6.3 (L1) Ensure 'Domain member: Digitally sign secure channel data (when possible)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters:Sign SecureChannel
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters' do
  values [{
    name: 'SignSecureChannel',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.6.4 (L1) Ensure 'Domain member: Disable machine account password changes' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters:Disa blePasswordChange
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters' do
  values [{
    name: 'DisablePasswordChange',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.6.5 (L1) Ensure 'Domain member: Maximum machine account password age' is set to '30 or fewer days, but not 0'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters' do
  values [{
    name: 'MaximumPasswordAge',
    type: :dword,
    data: 30,
  }]
  action :create
end

# 2.3.6.6 (L1) Ensure 'Domain member: Require strong (Windows 2000 or later) session key' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters:Requ ireStrongKey
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters' do
  values [{
    name: 'RequireStrongKey',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.7.1 (L1) Ensure 'Interactive logon: Do not display last user name' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: DontDisplayLastUserName
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'DontDisplayLastUserName',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.7.2 (L1) Ensure 'Interactive logon: Do not require CTRL+ALT+DEL' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: DisableCAD
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'DisableCAD',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.7.3 (BL) Ensure 'Interactive logon: Machine account lockout threshold' is set to '10 or fewer invalid logon attempts, but not 0'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: MaxDevicePasswordFailedAttempts
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'MaxDevicePasswordFailedAttempts',
    type: :dword,
    data: 10,
  }]
  action :create
end

# 2.3.7.4 (L1) Ensure 'Interactive logon: Machine inactivity limit' is set to '900 or fewer second(s), but not 0'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: InactivityTimeoutSecs
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'InactivityTimeoutSecs',
    type: :dword,
    data: 900,
  }]
  action :create
end

# 2.3.7.5 (L1) Configure 'Interactive logon: Message text for users attempting to log on'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: LegalNoticeText
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'LegalNoticeText',
    type: :string,
    data: 'This is a scary legal notice',
  }]
  action :create
end

# 2.3.7.6 (L1) Configure 'Interactive logon: Message title for users attempting to log on'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: LegalNoticeCaption
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'LegalNoticeCaption',
    type: :string,
    data: 'Tihis is the heading for the scary notice',
  }]
  action :create
end

# 2.3.7.7 (L2) Ensure 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' is set to '4 or fewer logon(s)'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon:CachedLogonsCount
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' do
  values [{
    name: 'CachedLogonsCount',
    type: :string,
    data: 4,
  }]
  action :create
end

# 2.3.7.8 (L1) Ensure 'Interactive logon: Prompt user to change password before expiration' is set to 'between 5 and 14 days'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon:PasswordExpiryWarning
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' do
  values [{
    name: 'PasswordExpiryWarning',
    type: :dword,
    data: 10,
  }]
  action :create
end

# 2.3.7.9 (L1) Ensure 'Interactive logon: Smart card removal behavior' is set to 'Lock Workstation' or higher
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon:ScRemoveOption
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' do
  values [{
    name: 'ScRemoveOption',
    type: :string,
    data: 1,
  }]
  action :create
end

# 2.3.8.1 (L1) Ensure 'Microsoft network client: Digitally sign communications (always)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parame ters:RequireSecuritySignature
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' do
  values [{
    name: 'RequireSecuritySignature',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.8.2 (L1) Ensure 'Microsoft network client: Digitally sign communications (if server agrees)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parame ters:EnableSecuritySignature
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' do
  values [{
    name: 'EnableSecuritySignature',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.8.3 (L1) Ensure 'Microsoft network client: Send unencrypted password to third-party SMB servers' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parame ters:EnablePlainTextPassword
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters' do
  values [{
    name: 'EnablePlainTextPassword',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.9.1 (L1) Ensure 'Microsoft network server: Amount of idle time required before suspending session' is set to '15 or fewer minute(s), but not 0'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: AutoDisconnect
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'AutoDisconnect',
    type: :dword,
    data: 15,
  }]
  action :create
end

# 2.3.9.2 (L1) Ensure 'Microsoft network server: Digitally sign communications (always)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: RequireSecuritySignature
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'RequireSecuritySignature',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.9.3 (L1) Ensure 'Microsoft network server: Digitally sign communications (if client agrees)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: EnableSecuritySignature
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'EnableSecuritySignature',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.9.4 (L1) Ensure 'Microsoft network server: Disconnect clients when logon hours expire' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: ForceLogoffWhenHourExpire
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'ForceLogoffWhenHourExpire',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.9.5 (L1) Ensure 'Microsoft network server: Server SPN target name validation level' is set to 'Accept if provided by client' or higher
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: SMBServerNameHardeningLevel
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'SMBServerNameHardeningLevel',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.10.1 (L1) Ensure 'Network access: Allow anonymous SID/Name translation' is set to 'Disabled'

# 2.3.10.2 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:RestrictAnonymousSAM
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'RestrictAnonymousSAM',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.10.3 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:RestrictAnonymous
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'RestrictAnonymous',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.10.4 (L1) Ensure 'Network access: Do not allow storage of passwords and credentials for network authentication' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:DisableDomainCreds
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'DisableDomainCreds',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.10.5 (L1) Ensure 'Network access: Let Everyone permissions apply to anonymous users' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:EveryoneIncludesAnony mous
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'EveryoneIncludesAnonymous',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.10.6 (L1) Ensure 'Network access: Named Pipes that can be accessed anonymously' is set to 'None'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: NullSessionPipes
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'NullSessionPipes',
    type: :multi_string,
    data: [],
  }]
  action :create
end

# 2.3.10.7 (L1) Ensure 'Network access: Remotely accessible registry paths'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths:Machine
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths' do
  values [{
    name: 'Machine',
    type: :multi_string,
    data: [
      'System\CurrentControlSet\Control\ProductOptions',
      'System\CurrentControlSet\Control\Server Applications',
      'Software\Microsoft\Windows NT\CurrentVersion'],
  }]
  action :create
end

# 2.3.10.8 (L1) Ensure 'Network access: Remotely accessible registry paths and sub-paths'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths:Machine
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths' do
  values [{
    name: 'Machine',
    type: :multi_string,
    data: [
      'System\CurrentControlSet\Control\Print\Printers',
      'System\CurrentControlSet\Services\Eventlog',
      'Software\Microsoft\OLAP Server',
      'Software\Microsoft\Windows NT\CurrentVersion\Print',
      'Software\Microsoft\Windows NT\CurrentVersion\Windows',
      'System\CurrentControlSet\Control\ContentIndex',
      'System\CurrentControlSet\Control\Terminal Server',
      'System\CurrentControlSet\Control\Terminal Server\UserConfig',
      'System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration',
      'Software\Microsoft\Windows NT\CurrentVersion\Perflib System\CurrentControlSet\Services\SysmonLog'],
  }]
  action :create
end

# 2.3.10.9 (L1) Ensure 'Network access: Restrict anonymous access to Named Pipes and Shares' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: RestrictNullSessAccess
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'RestrictNullSessAccess',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.10.10 (L1) Ensure 'Network access: Restrict clients allowed to make remote calls to SAM' is set to 'Administrators: Remote Access: Allow'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:restrictremotesam
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'restrictremotesam',
    type: :string,
    data: '(O:SYG:SYD:(A;;RC;;;BA)',
  }]
  action :create
end

# 2.3.10.11 (L1) Ensure 'Network access: Shares that can be accessed anonymously' is set to 'None'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters: NullSessionShares
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' do
  values [{
    name: 'NullSessionShares',
    type: :multi_string,
    data: [],
  }]
  action :create
end

# 2.3.10.12 (L1) Ensure 'Network access: Sharing and security model for local accounts' is set to 'Classic - local users authenticate as themselves'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:ForceGuest
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'ForceGuest',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.11.1 (L1) Ensure 'Network security: Allow Local System to use computer identity for NTLM' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:UseMachineId
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'UseMachineId',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.11.2 (L1) Ensure 'Network security: Allow LocalSystem NULL session fallback' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0:AllowNullSessi onFallback
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' do
  values [{
    name: 'AllowNullSessionFallback',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.11.3 (L1) Ensure 'Network Security: Allow PKU2U authentication requests to this computer to use online identities' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\pku2u:AllowOnlineID
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\pku2u' do
  values [{
    name: 'AllowOnlineID',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.11.4 (L1) Ensure 'Network security: Configure encryption types allowed for Kerberos' is set to 'AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ Kerberos\Parameters:SupportedEncryptionTypes
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters' do
  values [{
    name: 'SupportedEncryptionTypes',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.11.5 (L1) Ensure 'Network security: Do not store LAN Manager hash value on next password change' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:NoLMHash
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'NoLMHash',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.11.6 (L1) Ensure 'Network security: Force logoff when logon hours expire' is set to 'Enabled'

# 2.3.11.7 (L1) Ensure 'Network security: LAN Manager authentication level' is set to 'Send NTLMv2 response only. Refuse LM & NTLM'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa:LmCompatibilityLevel
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa' do
  values [{
    name: 'LmCompatibilityLevel',
    type: :dword,
    data: 5,
  }]
  action :create
end

# 2.3.11.8 (L1) Ensure 'Network security: LDAP client signing requirements' is set to 'Negotiate signing' or higher
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LDAP:LDAPClientIntegrity
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LDAP' do
  values [{
    name: 'LDAPClientIntegrity',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.11.9 (L1) Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) clients' is set to 'Require NTLMv2 session security, Require 128-bit encryption'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0:NTLMMinClientS ec
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' do
  values [{
    name: 'NTLMMinClientSec',
    type: :dword,
    data: 537395200,
  }]
  action :create
end

# 2.3.11.10 (L1) Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) servers' is set to 'Require NTLMv2 session security, Require 128-bit encryption'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0:NTLMMinServerS ec
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' do
  values [{
    name: 'NTLMMinServerSec',
    type: :dword,
    data: 537395200,
  }]
  action :create
end

# 2.3.14.1 (L2) Ensure 'System cryptography: Force strong key protection for user keys stored on the computer' is set to 'User is prompted when the key is first used' or higher
# HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography:ForceKeyProtectio n
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography' do
  values [{
    name: 'ForceKeyProtection',
    type: :dword,
    data: 2,
  }]
  action :create
end

# 2.3.15.1 (L1) Ensure 'System objects: Require case insensitivity for nonWindows subsystems' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel:ObCaseInsensitive
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel' do
  values [{
    name: 'ObCaseInsensitive',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.15.2 (L1) Ensure 'System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager:ProtectionMode
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager' do
  values [{
    name: 'ProtectionMode',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.17.1 (L1) Ensure 'User Account Control: Admin Approval Mode for the Built-in Administrator account' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: FilterAdministratorToken
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'FilterAdministratorToken',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.17.2 (L1) Ensure 'User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop' is set to 'Disabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: EnableUIADesktopToggle
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'EnableUIADesktopToggle',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.17.3 (L1) Ensure 'User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode' is set to 'Prompt for consent on the secure desktop'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: ConsentPromptBehaviorAdmin
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'ConsentPromptBehaviorAdmin',
    type: :dword,
    data: 2,
  }]
  action :create
end

# 2.3.17.4 (L1) Ensure 'User Account Control: Behavior of the elevation prompt for standard users' is set to 'Automatically deny elevation requests'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: ConsentPromptBehaviorUser
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'ConsentPromptBehaviorUser',
    type: :dword,
    data: 0,
  }]
  action :create
end

# 2.3.17.5 (L1) Ensure 'User Account Control: Detect application installations and prompt for elevation' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: EnableInstallerDetection
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'EnableInstallerDetection',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.17.6 (L1) Ensure 'User Account Control: Only elevate UIAccess applications that are installed in secure locations' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: EnableSecureUIAPaths
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'EnableSecureUIAPaths',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.17.7 (L1) Ensure 'User Account Control: Run all administrators in Admin Approval Mode' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: EnableLUA
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'EnableLUA',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.17.8 (L1) Ensure 'User Account Control: Switch to the secure desktop when prompting for elevation' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: PromptOnSecureDesktop
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'PromptOnSecureDesktop',
    type: :dword,
    data: 1,
  }]
  action :create
end

# 2.3.17.9 (L1) Ensure 'User Account Control: Virtualize file and registry write failures to per-user locations' is set to 'Enabled'
# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System: EnableVirtualization
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'EnableVirtualization',
    type: :dword,
    data: 1,
  }]
  action :create
end
