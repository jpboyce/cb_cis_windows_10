# Windows 10 CIS Benchmark Items - Section 19.5 - Administrative Templates (User), Start Menu and Taskbar

# Ensure 'Turn off toast notifications on the lock screen' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' do
   values [{
     name: 'NoToastApplicationNotificationOnLockScreen',
     type: :dword,
     data: 1,
   }]
   action :create
   recursive true
end
