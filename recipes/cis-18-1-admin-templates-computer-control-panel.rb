# Windows 10 CIS Benchmark Items - Section 18.1 - Administrative Templates (Computer), Control Panel

# Ensure 'Prevent enabling lock screen camera' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization' do
  values [{
    name: 'NoLockScreenCamera',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Prevent enabling lock screen slide show' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization' do
  values [{
    name: 'NoLockScreenSlideshow',
    type: :dword,
    data: 1,
  }]
  action :create
end

# Ensure 'Allow Input Personalization' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization' do
  values [{
    name: 'AllowInputPersonalization',
    type: :dword,
    data: 0,
  }]
  action :create
end
