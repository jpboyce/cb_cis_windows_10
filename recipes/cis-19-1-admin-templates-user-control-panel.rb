# Windows 10 CIS Benchmark Items - Section 19.1 - Administrative Templates (User), Control Panel
# Foodcritic will complain about this rule, but this layout is more aligned with what we want anyway

# Ensure 'Enable screen saver' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop' do
   values [{
     name: 'ScreenSaveActive',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Force specific screen saver: Screen saver executable name' is set to 'Enabled: scrnsave.scr'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop' do
   values [{
     name: 'SCRNSAVE.EXE',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Password protect the screen saver' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop' do
   values [{
     name: 'ScreenSaverIsSecure',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end

# Ensure 'Screen saver timeout' is set to 'Enabled: 900 seconds or fewer, but not 0'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop' do
   values [{
     name: 'ScreenSaveTimeOut',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end
