# Windows 10 CIS Benchmark Items - Section 18.4 - Administrative Templates (Computer), MSS (Legacy)

# Ensure 'MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' do
  values [{
    name: 'AutoAdminLogon',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)' is set to 'Enabled: Highest protection, source routing is completely disabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters' do
  values [{
    name: 'DisableIPSourceRouting',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)' is set to 'Enabled: Highest protection, source routing is completely disabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' do
  values [{
    name: 'DisableIPSourceRouting',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (DisableSavePassword) Prevent the dial-up password from being saved' is set to 'Enabled'
# L2 Setting
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan\Parameters' do
  values [{
    name: 'DisableSavePassword',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' do
  values [{
    name: 'EnableICMPRedirect',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds' is set to 'Enabled: 300,000 or 5 minutes (recommended)
# L2 setting
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' do
  values [{
    name: 'KeepAliveTime',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters' do
  values [{
    name: 'NoNameReleaseOnDemand',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)' is set to 'Disabled'
# L2 Setting
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' do
  values [{
    name: 'PerformRouterDiscovery',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager' do
  values [{
    name: 'SafeDllSearchMode',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)' is set to 'Enabled: 5 or fewer seconds'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' do
  values [{
    name: 'ScreenSaverGracePeriod',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'
# L2 Setting
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters' do
  values [{
    name: 'TcpMaxDataRetransmissions',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'
# L2 Setting
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' do
  values [{
    name: 'TcpMaxDataRetransmissions',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' is set to 'Enabled: 90% or less'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security' do
  values [{
    name: 'WarningLevel',
    type: :dword,
    data: 1,
  }]
  action :create
end
