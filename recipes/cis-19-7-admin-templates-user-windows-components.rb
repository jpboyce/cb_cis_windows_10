# Windows 10 CIS Benchmark Items - Section 19.7 - Administrative Templates (User), Windows Componentsx

# Ensure 'Do not preserve zone information in file attachments' is set to 'Disabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments' do
  values [{
    name: 'SaveZoneInformation',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
end

# Ensure 'Notify antivirus programs when opening attachments' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments' do
  values [{
    name: 'ScanWithAntiVirus',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
end

# Ensure 'Configure Windows spotlight on Lock Screen' is set to Disabled'
registry_key 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\CloudContent' do
  values [{
    name: 'ConfigureWindowsSpotlight',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
end

# Ensure 'Do not suggest third-party content in Windows spotlight' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\CloudContent' do
  values [{
    name: 'DisableThirdPartySuggestions',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
end

# Ensure 'Do not use diagnostic data for tailored experiences' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\CloudContent' do
  values [{
    name: 'DisableTailoredExperiencesWithDiagnosticData',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
end

# Ensure 'Turn off all Windows spotlight features' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\Software\Policies\Microsoft\Windows\CloudContent' do
  values [{
    name: 'DisableWindowsSpotlightFeatures',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
  recursive true
end

# Ensure 'Prevent users from sharing files within their profile.' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
  values [{
    name: 'NoInplaceSharing',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
end

# Ensure 'Always install with elevated privileges' is set to 'Disabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\Windows\Installer' do
  values [{
    name: 'AlwaysInstallElevated',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
end

# Ensure 'Prevent Codec Download' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer' do
  values [{
    name: 'PreventCodecDownload',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
  recursive true
end
