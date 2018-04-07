# Windows 10 CIS Benchmark Items - Section 18.8 - Administrative Templates (Computer), Systemx

# Ensure 'Include command line in process creation events' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit' do
   values [{
     name: 'ProcessCreationIncludeCmdLine_Enabled',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Remote host allows delegation of non-exportable credentials' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation' do
   values [{
     name: 'AllowProtectedCreds',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Prevent installation of devices that match any of these device IDs' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions' do
   values [{
     name: 'DenyDeviceIDs',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Ensure 'Prevent installation of devices that match any of these device IDs: Prevent installation of devices that match any of these device IDs' is set to 'PCI\CC_0C0A'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs' do
   values [{
     name: '1',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Ensure 'Prevent installation of devices that match any of these device IDs: Also apply to matching devices that are already installed.' is set to 'True
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions' do
   values [{
     name: 'DenyDeviceIDsRetroactive',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Ensure 'Prevent installation of devices using drivers that match these device setup classes' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions' do
   values [{
     name: 'DenyDeviceClasses',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Ensure 'Prevent installation of devices using drivers that match these device setup classes: Prevent installation of devices using drivers for these device setup' is set to '{d48179be-ec20-11d1-b6b800c04fa372a7}'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses' do
   values [{
     name: '1',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Ensure 'Prevent installation of devices using drivers that match these device setup classes: Also apply to matching devices that are already installed.' is set to 'True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions' do
   values [{
     name: 'DenyDeviceClassesRetroactive',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Ensure 'Boot-Start Driver Initialization Policy' is set to 'Enabled: Good, unknown and bad but critical'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\EarlyLaunch' do
   values [{
     name: 'DriverLoadPolicy',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Configure registry policy processing: Do not apply during periodic background processing' is set to 'Enabled: FALSE'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\NoBackgroundPolicy' do
   values [{
     name: '',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { registry_key_exists?('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}', :x86_64) }
end

# Ensure 'Configure registry policy processing: Process even if the Group Policy objects have not changed' is set to 'Enabled: TRUE'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\NoGPOListChanges' do
   values [{
     name: '',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { registry_key_exists?('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}', :x86_64) }
end

# Ensure 'Turn off background refresh of Group Policy' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
   values [{
     name: 'DisableBkGndGroupPolicy',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Continue experiences on this device' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'EnableCdp',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off access to the Store' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer' do
   values [{
     name: 'NoUseStoreOpenWith',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off downloading of print drivers over HTTP' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers' do
   values [{
     name: 'DisableWebPnPDownload',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off handwriting personalization data sharing' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC' do
   values [{
     name: 'PreventHandwritingDataSharing',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off handwriting recognition error reporting' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' do
   values [{
     name: 'PreventHandwritingErrorReports',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard' do
   values [{
     name: 'ExitOnMSICW',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off Internet download for Web publishing and online ordering wizards' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
   values [{
     name: 'NoWebServices',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off printing over HTTP' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers' do
   values [{
     name: 'DisableHTTPPrinting',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off Registration if URL connection is referring to Microsoft.com' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control\NoRegistration' do
   values [{
     name: '',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off Search Companion content file updates' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion' do
   values [{
     name: 'DisableContentFileUpdates',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off the Order Prints' picture task' is set to 'Enabled''
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
   values [{
     name: 'NoOnlinePrintsWizard',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off the Publish to Web' task for files and folders' is set to 'Enabled''
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
   values [{
     name: 'NoPublishingWizard',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off the Windows Messenger Customer Experience Improvement Program' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client' do
   values [{
     name: 'CEIP',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off Windows Customer Experience Improvement Program' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows' do
   values [{
     name: 'CEIPEnable',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off Windows Error Reporting' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' do
   values [{
     name: 'Disable',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Support device authentication using certificate' is set to 'Enabled: Automatic'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ kerberos\parameters:DevicePKInitBehavior HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ kerberos\parameters' do
   values [{
     name: 'DevicePKInitEnabled',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Disallow copying of user input methods to the system account for sign-in' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Control Panel\International' do
   values [{
     name: 'BlockUserInputMethodsForSignIn',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Do not display network selection UI' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'DontDisplayNetworkSelectionUI',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Do not enumerate connected users on domainjoined computers' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'DontEnumerateConnectedUsers',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Enumerate local users on domain-joined computers' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'EnumerateLocalUsers',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off app notifications on the lock screen' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'DisableLockScreenAppNotifications',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn on convenience PIN sign-in' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'AllowDomainPINLogon',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Block user from showing account details on signin' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'BlockUserFromShowingAccountDetailsOnSignin',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Untrusted Font Blocking' is set to 'Enabled: Block untrusted fonts and log events'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions' do
   values [{
     name: 'MitigationOptions_FontBocking',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow standby states (S1-S3) when sleeping (on battery)' is set to 'Disabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc25193608-4c2a-94ea-171b0ed546ab' do
   values [{
     name: 'DCSettingIndex',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Ensure 'Allow standby states (S1-S3) when sleeping (plugged in)' is set to 'Disabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab' do
   values [{
     name: 'ACSettingIndex',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['bitlocker'] == 'true' }
end

# Commenting these out for now until I write a check for laptops
=begin
# Ensure 'Require a password when a computer wakes (on battery)' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51' do
   values [{
     name: 'DCSettingIndex',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Require a password when a computer wakes (plugged in)' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51' do
   values [{
     name: 'ACSettingIndex',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow network connectivity during connectedstandby (plugged in)' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9' do
   values [{
     name: 'ACSettingIndex',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow network connectivity during connectedstandby (on battery)' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9' do
   values [{
     name: 'DCSettingIndex',
     type: :dword,
     data: 1,
   }]
   action :create
end
=end

# Ensure 'Configure Offer Remote Assistance' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fAllowUnsolicited',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Configure Solicited Remote Assistance' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fAllowToGetHelp',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Enable RPC Endpoint Mapper Client Authentication' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc' do
   values [{
     name: 'EnableAuthEpResolution',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Restrict Unauthenticated RPC clients' is set to 'Enabled: Authenticated' NEver apply to a domain controoler
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc' do
   values [{
     name: 'RestrictRemoteClients',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy' do
   values [{
     name: 'DisableQueryRemoteServer',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Enable/Disable PerfTrack' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b9654fc3-8781-88dd50a6299d}' do
   values [{
     name: 'ScenarioExecutionEnabled',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off the advertising ID' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\policies\Microsoft\Windows\AdvertisingInfo' do
   values [{
     name: 'DisabledByGroupPolicy',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Enable Windows NTP Client' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient' do
   values [{
     name: 'Enabled',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Enable Windows NTP Server' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer' do
   values [{
     name: 'Enabled',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end
