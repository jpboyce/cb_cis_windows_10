# Windows 10 CIS Benchmark Items - Section 18.5 - Administrative Templates (Computer), Networkx

# Ensure 'Turn off multicast name resolution' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' do
  values [{
    name: 'EnableMulticast',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Set 'NetBIOS node type' to 'P-node' (Ensure NetBT Parameter 'NodeType' is set to '0x2 (2)')
registry_key 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters' do
  values [{
    name: 'NodeType',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Enable Font Providers' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
  values [{
    name: 'EnableFontProviders',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Enable insecure guest logons' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation' do
  values [{
    name: 'AllowInsecureGuestAuth',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Turn on Mapper I/O (LLTDIO) driver' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'AllowLLTDIOOnDomain',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'AllowLLTDIOOnPublicNet',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'EnableLLTDIO',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'ProhibitLLTDIOOnPrivateNet',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn on Responder (RSPNDR) driver' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'AllowRspndrOnDomain',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'AllowRspndrOnPublicNet',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'EnableRspndr',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD' do
  values [{
    name: 'ProhibitRspndrOnPrivateNet',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off Microsoft Peer-to-Peer Networking Services' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Peernet' do
  values [{
    name: 'Disabled',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Prohibit installation and configuration of Network Bridge on your DNS domain network' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections' do
  values [{
    name: 'NC_AllowNetBridge_NLA',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Require domain users to elevate when setting a network's location' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections' do
  values [{
    name: 'NC_StdDomainUserSetLocation',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Prohibit use of Internet Connection Sharing on your DNS domain network' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections' do
  values [{
    name: 'NC_ShowSharedAccessUI',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Hardened UNC Paths' is set to 'Enabled, with 'Require Mutual Authentication' and 'Require Integrity' set for all NETLOGON and SYSVOL shares'
=begin
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths' do
  values [{
    name: 'WarningLevel',
    type: :dword,
    data: 1,
  }]
  action :create
end

# \:\\*\NETLOGON

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths' do
  values [{
    name: 'WarningLevel',
    type: :dword,
    data: 1,
  }]
  action :create
 end
# \:\\*\SYSVOL
=end

# Disable IPv6 (Ensure TCPIP6 Parameter 'DisabledComponents' is set to '0xff (255)')
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters' do
  values [{
    name: 'DisabledComponents',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end
# L2

# Ensure 'Configuration of wireless settings using Windows Connect Now' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' do
  values [{
    name: 'EnableRegistrars',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' do
  values [{
    name: 'DisableUPnPRegistrar',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' do
  values [{
    name: 'DisableInBand802DOT11Registrar',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' do
  values [{
    name: 'DisableFlashConfigRegistrar',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' do
  values [{
    name: 'DisableWPDRegistrar',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Prohibit access of the Windows Connect Now wizards' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\UI' do
  values [{
    name: 'DisableWcnUi',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Minimize the number of simultaneous connections to the Internet or a Windows Domain' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy' do
  values [{
    name: 'fMinimizeConnections',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Prohibit connection to non-domain networks when connected to domain authenticated network' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy' do
  values [{
    name: 'fBlockNonDomain',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Allow Windows to automatically connect to suggested open hotspots, to networks shared by contacts, and to hotspots offering paid services' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config' do
  values [{
    name: 'AutoConnectAllowedOEM',
    type: :dword,
    data: 1,
  }]
  action :create
end
