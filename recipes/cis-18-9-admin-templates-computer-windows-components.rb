# Windows 10 CIS Benchmark Items - Section 18.9 - Administrative Templates (Computer), Windows Components

# Ensure 'Allow a Windows app to share application data between users' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppMode l\StateManager' do
   values [{
     name: 'AllowSharedLocalAppData',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Allow Microsoft accounts to be optional' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
   values [{
     name: 'MSAOptional',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Block launching Windows Store apps with Windows Runtime API access from hosted content.' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
   values [{
     name: 'BlockHostedAppAccessWinRT',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Disallow Autoplay for non-volume devices' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer' do
   values [{
     name: 'NoAutoplayfornonVolume',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Set the default behavior for AutoRun' is set to 'Enabled: Do not execute any autorun commands'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
   values [{
     name: 'NoAutorun',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off Autoplay' is set to 'Enabled: All drives'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
   values [{
     name: 'NoDriveTypeAutoRun',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Use enhanced anti-spoofing when available' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures' do
   values [{
     name: 'EnhancedAntiSpoofing',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Allow access to BitLocker-protected fixed data drives from earlier versions of Windows' is set to 'Disabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVDiscoveryVolumeType',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVRecovery',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Allow data recovery agent' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVManageDRA',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Recovery Password' is set to 'Enabled: Allow 48-digit recovery password'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVRecoveryPassword',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Recovery Key' is set to 'Enabled: Allow 256-bit recovery key'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVRecoveryKey',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVHideRecoveryPage',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Save BitLocker recovery information to AD DS for fixed data drives' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVActiveDirectoryBackup',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Configure storage of BitLocker recovery information to AD DS' is set to 'Enabled: Backup recovery passwords and key packages'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVActiveDirectoryInfoToStore',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for fixed data drives' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVRequireActiveDirectoryBackup',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for fixed data drives' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVHardwareEncryption',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for fixed data drives: Use BitLocker software-based encryption when hardware encryption is not available' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVAllowSoftwareEncryptionFailover',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for fixed data drives: Restrict encryption algorithms and cipher suites allowed for hardware-based encryption' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVRestrictHardwareEncryptionAlgorithms',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for fixed data drives: Restrict crypto algorithms or cipher suites to the following:' is set to 'Enabled: 2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVAllowedHardwareEncryptionAlgorithms',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of passwords for fixed data drives' is set to 'Disabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVPassphrase',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of smart cards on fixed data drives' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVAllowUserCert',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of smart cards on fixed data drives: Require use of smart cards on fixed data drives' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'FDVEnforceUserCert',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Allow enhanced PINs for startup' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'UseEnhancedPin',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Allow Secure Boot for integrity validation' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSAllowSecureBootForIntegrity',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSRecovery',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Allow data recovery agent' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSManageDRA',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Recovery Password' is set to 'Enabled: Require 48-digit recovery password'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSRecoveryPassword',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Recovery Key' is set to 'Enabled: Do not allow 256-bit recovery key'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSRecoveryKey',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSHideRecoveryPage',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Save BitLocker recovery information to AD DS for operating system drives' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSActiveDirectoryBackup',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Configure storage of BitLocker recovery information to AD DS:' is set to 'Enabled: Store recovery passwords and key packages'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSActiveDirectoryInfoToStore',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for operating system drives' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSRequireActiveDirectoryBackup',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure minimum PIN length for startup' is set to 'Enabled: 7 or more characters'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'MinimumPIN',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for operating system drives' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSHardwareEncryption',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for operating system drives: Use BitLocker software-based encryption when hardware encryption is not available' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSAllowSoftwareEncryptionFailover',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for operating system drives: Restrict encryption algorithms and cipher suites allowed for hardware-based encryption' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSRestrictHardwareEncryptionAlgorithms',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for operating system drives: Restrict crypto algorithms or cipher suites to the following:' is set to 'Enabled: 2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSAllowedHardwareEncryptionAlgorithms',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of passwords for operating system drives' is set to 'Disabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'OSPassphrase',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Require additional authentication at startup' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'UseAdvancedStartup',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Require additional authentication at startup: Allow BitLocker without a compatible TPM' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'EnableBDEWithNoTPM',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Require additional authentication at startup: Configure TPM startup:' is set to 'Enabled: Do not allow TPM'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'UseTPM',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Require additional authentication at startup: Configure TPM startup PIN:' is set to 'Enabled: Require startup PIN with TPM'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'UseTPMPIN',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Require additional authentication at startup: Configure TPM startup key:' is set to 'Enabled: Do not allow startup key with TPM'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'UseTPMKey',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Require additional authentication at startup: Configure TPM startup key and PIN:' is set to 'Enabled: Do not allow startup key and PIN with TPM'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'UseTPMKeyPIN',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Allow access to BitLocker-protected removable data drives from earlier versions of Windows' is set to 'Disabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVDiscoveryVolumeType',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVRecovery',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered: Allow data recovery agent' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVManageDRA',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered: Recovery Password' is set to 'Enabled: Do not allow 48-digit recovery password'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVRecoveryPassword',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered: Recovery Key' is set to 'Enabled: Do not allow 256-bit recovery key'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVRecoveryKey',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVHideRecoveryPage',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered: Save BitLocker recovery information to AD DS for removable data drives' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVActiveDirectoryBackup',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered: Configure storage of BitLocker recovery information to AD DS:' is set to 'Enabled: Backup recovery passwords and key packages'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVActiveDirectoryInfoToStore',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose how BitLocker-protected removable drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for removable data drives' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVRequireActiveDirectoryBackup',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for removable data drives' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVHardwareEncryption',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for removable data drives: Use BitLocker software-based encryption when hardware encryption is not available' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVAllowSoftwareEncryptionFailover',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for removable data drives: Restrict encryption algorithms and cipher suites allowed for hardware-based encryption' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVRestrictHardwareEncryptionAlgorithms',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of hardware-based encryption for removable data drives: Restrict crypto algorithms or cipher suites to the following:' is set to 'Enabled: 2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVAllowedHardwareEncryptionAlgorithms',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of passwords for removable data drives' is set to 'Disabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVPassphrase',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of smart cards on removable data drives' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVAllowUserCert',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Configure use of smart cards on removable data drives: Require use of smart cards on removable data drives' is set to 'Enabled: True'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVEnforceUserCert',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Deny write access to removable drives not protected by BitLocker' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVDenyWriteAccess',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Deny write access to removable drives not protected by BitLocker: Do not allow write access to devices configured in another organization' is set to 'Enabled: False'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'RDVDenyCrossOrg',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Choose drive encryption method and cipher strength (Windows 10 [Version 1511] and later)' is set to 'Enabled: XTSAES 256-bit'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE:EncryptionMethodWithXtsFdv HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE:EncryptionMethodWithXtsOs HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'EncryptionMethodWithXtsRdv',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Disable new DMA devices when this computer is locked' is set to 'Enabled'
# BitLocker Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE' do
   values [{
     name: 'DisableExternalDMAUnderLock',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['bitlocker'] == 'true' }
end

# Ensure 'Allow Use of Camera' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Camera' do
   values [{
     name: 'AllowCamera',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Turn off Microsoft consumer experiences' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent' do
   values [{
     name: 'DisableWindowsConsumerFeatures',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Require pin for pairing' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Connect' do
   values [{
     name: 'RequirePinForPairing',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Do not display the password reveal button' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredUI' do
   values [{
     name: 'DisablePasswordReveal',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Enumerate administrator accounts on elevation' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI' do
   values [{
     name: 'EnumerateAdministrators',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow Telemetry' is set to 'Enabled: 0 - Security [Enterprise Only]'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' do
   values [{
     name: 'AllowTelemetry',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Configure Authenticated Proxy usage for the Connected User Experience and Telemetry service' is set to 'Enabled: Disable Authenticated Proxy usage'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' do
   values [{
     name: 'DisableEnterpriseAuthProxy',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Disable pre-release features or settings' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' do
   values [{
     name: 'EnableConfigFlighting',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Do not show feedback notifications' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' do
   values [{
     name: 'DoNotShowFeedbackNotifications',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Toggle user control over Insider builds' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' do
   values [{
     name: 'AllowBuildPreview',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Download Mode' is NOT set to 'Enabled: Internet'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' do
   values [{
     name: 'DODownloadMode',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Application: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' do
   values [{
     name: 'Retention',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Application: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' do
   values [{
     name: 'MaxSize',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Security: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' do
   values [{
     name: 'Retention',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Security: Specify the maximum log file size (KB)' is set to 'Enabled: 196,608 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' do
   values [{
     name: 'MaxSize',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Setup: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' do
   values [{
     name: 'Retention',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Setup: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' do
   values [{
     name: 'MaxSize',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'System: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' do
   values [{
     name: 'Retention',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'System: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' do
   values [{
     name: 'MaxSize',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Turn off Data Execution Prevention for Explorer' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer' do
   values [{
     name: 'NoDataExecutionPrevention',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off heap termination on corruption' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer' do
   values [{
     name: 'NoHeapTerminationOnCorruption',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off shell protocol protected mode' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
   values [{
     name: 'PreXPSP2ShellProtocolBehavior',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Prevent the computer from joining a homegroup' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup\DisableHomeGroup' do
   values [{
     name: '',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Turn off Windows Location Provider' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' do
   values [{
     name: 'DisableWindowsLocationProvider',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Block all consumer Microsoft account user authentication' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftAccount' do
   values [{
     name: 'DisableUserAuth',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow Address bar drop-down list suggestions' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\ServiceUI' do
   values [{
     name: 'ShowOneBox',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Allow Adobe Flash' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons' do
   values [{
     name: 'FlashPlayerEnabled',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Allow Extensions' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions' do
   values [{
     name: 'ExtensionsEnabled',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Allow InPrivate Browsing' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
   values [{
     name: 'AllowInPrivate',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Configure cookies' is set to 'Enabled: Block only 3rd-party cookies' or higher
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
   values [{
     name: 'Cookies',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Configure Password Manager' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
   values [{
     name: 'FormSuggestPasswords',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Configure Pop-up Blocker' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
   values [{
     name: 'AllowPopups',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Configure search suggestions in Address bar' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes' do
   values [{
     name: 'ShowSearchSuggestionsGlobal',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Configure the Adobe Flash Click-to-Run setting' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security' do
   values [{
     name: 'FlashClickToRunMode',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Prevent access to the about:flags page in Microsoft Edge' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
   values [{
     name: 'PreventAccessToAboutFlagsInMicrosoftEdge',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Prevent using Localhost IP address for WebRTC' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
   values [{
     name: 'HideLocalHostIP',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Prevent the usage of OneDrive for file storage' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive' do
   values [{
     name: 'DisableFileSyncNGSC',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Do not allow passwords to be saved' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'DisablePasswordSaving',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow users to connect remotely by using Remote Desktop Services' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fDenyTSConnections',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Do not allow COM port redirection' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fDisableCcm',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Do not allow drive redirection' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fDisableCdm',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Do not allow LPT port redirection' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fDisableLPT',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Do not allow supported Plug and Play device redirection' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fDisablePNPRedir',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Always prompt for password upon connection' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fPromptForPassword',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Require secure RPC communication' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'fEncryptRPCTraffic',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Set client connection encryption level' is set to 'Enabled: High Level'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'MinEncryptionLevel',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Set time limit for active but idle Remote Desktop Services sessions' is set to 'Enabled: 15 minutes or less'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'MaxIdleTime',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Set time limit for disconnected sessions' is set to 'Enabled: 1 minute'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'MaxDisconnectionTime',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Do not delete temp folders upon exit' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'DeleteTempDirsOnExit',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Do not use temporary folders per session' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
   values [{
     name: 'PerSessionTempDir',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Prevent downloading of enclosures' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds' do
   values [{
     name: 'DisableEnclosureDownload',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Allow Cortana' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
   values [{
     name: 'AllowCortana',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow Cortana above lock screen' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
   values [{
     name: 'AllowCortanaAboveLock',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow indexing of encrypted files' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
   values [{
     name: 'AllowIndexingEncryptedStoresOrItems',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow search and Cortana to use location' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
   values [{
     name: 'AllowSearchToUseLocation',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off KMS Client Online AVS Validation' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' do
   values [{
     name: 'NoGenTicket',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Disable all apps from Windows Store' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
   values [{
     name: 'DisableStoreApps',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Turn off Automatic Download and Install of updates' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
   values [{
     name: 'AutoDownload',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off the offer to update to the latest version of Windows' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
   values [{
     name: 'DisableOSUpgrade',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn off the Store application' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
   values [{
     name: 'RemoveWindowsStore',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Join Microsoft MAPS' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' do
   values [{
     name: 'SpynetReporting',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Configure Watson events' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting' do
   values [{
     name: 'DisableGenericRePorts',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Configure Windows Defender SmartScreen' is set to 'Enabled: Warn'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
   values [{
     name: 'EnableSmartScreen',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Configure Windows Defender SmartScreen' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' do
   values [{
     name: 'EnabledV9',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Prevent bypassing Windows Defender SmartScreen prompts for files' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' do
   values [{
     name: 'PreventOverrideAppRepUnknown',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Prevent bypassing Windows Defender SmartScreen prompts for sites' is set to 'Enabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' do
   values [{
     name: 'PreventOverride',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Enables or disables Windows Game Recording and Broadcasting' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR' do
   values [{
     name: 'AllowGameDVR',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow Windows Ink Workspace' is set to 'Enabled: On, but disallow access above lock' OR 'Disabled' but not 'Enabled: On'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' do
   values [{
     name: 'AllowWindowsInkWorkspace',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Allow suggested apps in Windows Ink Workspace' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' do
   values [{
     name: 'AllowSuggestedAppsInWindowsInkWorkspace',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Allow user control over installs' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' do
   values [{
     name: 'EnableUserControl',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Always install with elevated privileges' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' do
   values [{
     name: 'AlwaysInstallElevated',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Prevent Internet Explorer security prompt for Windows Installer scripts' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' do
   values [{
     name: 'SafeForScripting',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
end

# Ensure 'Sign-in last interactive user automatically after a system-initiated restart' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
   values [{
     name: 'DisableAutomaticRestartSignOn',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Turn on PowerShell Script Block Logging' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' do
   values [{
     name: 'EnableScriptBlockLogging',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Turn on PowerShell Transcription' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription' do
   values [{
     name: 'EnableTranscripting',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Allow Basic authentication' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' do
   values [{
     name: 'AllowBasic',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Allow unencrypted traffic' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' do
   values [{
     name: 'AllowUnencryptedTraffic',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Disallow Digest authentication' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' do
   values [{
     name: 'AllowDigest',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Allow Basic authentication' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
   values [{
     name: 'AllowBasic',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Allow remote server management through WinRM' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
   values [{
     name: 'AllowAutoConfig',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
   recursive true
end

# Ensure 'Allow unencrypted traffic' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
   values [{
     name: 'AllowUnencryptedTraffic',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Disallow WinRM from storing RunAs credentials' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
   values [{
     name: 'DisableRunAs',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Allow Remote Shell Access' is set to 'Disabled'
# Level 2 Rule
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS' do
   values [{
     name: 'AllowRemoteShellAccess',
     type: :dword,
     data: 1,
   }]
   action :create
   only_if { node['cis']['level']['2'] == 'true' }
   recursive true
end

# Ensure 'Select when Feature Updates are received' is set to 'Enabled: Current Branch for Business, 180 or more days'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' do
   values [{
     name: 'DeferFeatureUpdates',
     type: :dword,
     data: 1,
   }]
   action :create
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' do
   values [{
     name: 'DeferFeatureUpdatesPeriodInDays',
     type: :dword,
     data: 1,
   }]
   action :create
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' do
   values [{
     name: 'BranchReadinessLevel',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Select when Quality Updates are received' is set to 'Enabled: 0 days'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' do
   values [{
     name: 'DeferQualityUpdates',
     type: :dword,
     data: 1,
   }]
   action :create
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' do
   values [{
     name: 'DeferQualityUpdatesPeriodInDays',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Configure Automatic Updates' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' do
   values [{
     name: 'NoAutoUpdate',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' do
   values [{
     name: 'ScheduledInstallDay',
     type: :dword,
     data: 1,
   }]
   action :create
end

# Ensure 'No auto-restart with logged on users for scheduled automatic updates installations' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' do
   values [{
     name: 'NoAutoRebootWithLoggedOnUsers',
     type: :dword,
     data: 1,
   }]
   action :create
end
