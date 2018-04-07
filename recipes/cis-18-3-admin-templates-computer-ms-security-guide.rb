# Windows 10 CIS Benchmark Items - Section 18.3 - Administrative Templates (Computer), MS Security Guide

# Ensure 'Apply UAC restrictions to local accounts on network logons' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    name: 'LocalAccountTokenFilterPolicy',
    type: :dword,
    data: 0,
  }]
  action :create
end

# Ensure 'Configure SMB v1 client driver' is set to 'Enabled: Disable driver'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10' do
  values [{
    name: 'Start',
    type: :dword,
    data: 4,
  }]
  action :create
end

# Ensure 'Configure SMB v1 server' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' do
  values [{
    name: 'SMB1',
    type: :dword,
    data: 0,
  }]
  action :create
end

# Ensure 'Enable Structured Exception Handling Overwrite Protection (SEHOP)' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel' do
  values [{
    name: 'DisableExceptionChainValidation',
    type: :dword,
    data: 0,
  }]
  action :create
end

# Ensure 'Turn on Windows Defender protection against Potentially Unwanted Applications' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine' do
  values [{
    name: 'MpEnablePus',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'WDigest Authentication' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest' do
  values [{
    name: 'UseLogonCredential',
    type: :dword,
    data: 0,
  }]
  action :create
end
