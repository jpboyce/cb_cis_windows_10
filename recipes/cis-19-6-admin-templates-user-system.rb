# Windows 10 CIS Benchmark Items - Section 19.6 - Administrative Templates (User), System

# Ensure 'Turn off Help Experience Improvement Program' is set to 'Enabled'
registry_key 'HKEY_USERS\.DEFAULT\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0' do
  values [{
    name: 'NoImplicitFeedback',
    type: :dword,
    data: 1,
  }]
  action :create
  only_if { node['cb_cis_windows_10']['cis_level']['2'] == 'true' }
  recursive true
end
