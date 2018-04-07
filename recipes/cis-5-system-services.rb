# Windows 10 CIS Benchmark Items - Section 5 - System Services

# Service template to stop and disable a service
# windows_service 'servicename' do
# action [:stop, :disable]
# xend

# if CIS Level 1 is set to yes, then we apply the items
if node['cb_cis_windows_10']['cis_level']['1'] == 'yes'
  # apply level 1 items
  node['cb_cis_windows_10']['cis_level_1']['services'].each do |i|
    next unless ::Win32::Service.exists?
    # check if the service actually exists first so we don't generate errors
    Chef::Log.warn("Checking if service #{i} has any dependencies")
    powershell_script 'DependencyCheck' do
      code <<-EOH
        Start-Transcript -Verbose
        $serviceList = (Get-Service -Name #{i} | Select DependentServices).DependentServices
          if( ($serviceList.count) -gt 0) {
            Write-Warning "Dependent services have been found, going to brute force stop them..."
            foreach($item in $serviceList){
              Write-Warning "Attempting to stop service $($item.Name)"
              Get-Service $item.Name | Stop-Service -Force -Verbose
              }
            }
          Stop-Transcript -Verbose
        EOH
    end
    windows_service i do
      action [:stop, :disable]
    end
  end
end

# if CIS Level 2 is set to yes, then we apply the items
if node['cb_cis_windows_10']['cis_level']['2'] == 'yes'
  # apply level 2 items
  node['cb_cis_windows_10']['cis_level_2']['services'].each do |i|
    next unless ::Win32::Service.exists?
    # check if the service actually exists first so we don't generate errors
    windows_service i do
      action [:stop, :disable]
    end
  end
end
