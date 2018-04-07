# Windows 10 CIS Benchmark Items - Section 18.2 - Administrative Templates (Computer), LAPS

# Ensure 'Do not allow password expiration time longer than required by policy' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd' do
  values [{
    name: 'PwdExpirationProtectionEnabled',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { registry_key_exists?('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D087DE603E3EA}', :x86_x64) }
end

# Ensure 'Enable Local Admin Password Management' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd' do
  values [{
    name: 'AdmPwdEnabled',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { registry_key_exists?('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D087DE603E3EA}', :x86_x64) }
end

# Ensure 'Password Settings: Password Complexity' is set to 'Enabled: Large letters + small letters + numbers + special characters'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd' do
  values [{
    name: 'PasswordComplexity',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { registry_key_exists?('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D087DE603E3EA}', :x86_x64) }
end

# Ensure 'Password Settings: Password Length' is set to 'Enabled: 15 or more'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd' do
  values [{
    name: 'PasswordLength',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { registry_key_exists?('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D087DE603E3EA}', :x86_x64) }
end

# Ensure 'Password Settings: Password Age (Days)' is set to 'Enabled: 30 or fewer'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd' do
  values [{
    name: 'PasswordAgeDays',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { registry_key_exists?('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D087DE603E3EA}', :x86_x64) }
end
