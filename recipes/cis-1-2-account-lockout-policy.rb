# Windows 10 CIS Benchmark Items - Section 1.2 Accout Lockout Policy

# Ensure 'Account lockout duration' is set to '15 or more minute(s)'
security_policy 'Account lockout duration' do
  log_location "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Accout_Lockout_Policy.log"
  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Account_lockout_duration.inf"
  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{node['cb_cis_windows_10']['secedit_database']['name']}"
  action :configure
end

# Ensure 'Account lockout threshold' is set to '10 or fewer invalid logon attempt(s), but not 0'
# security_policy 'Account lockout threshold' do
#  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Account lockout threshold.inf}"
#  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{['cb_cis_windows_10']['secedit_database']['name']}"
#  action :configure
# end

# Ensure 'Reset account lockout counter after' is set to '15 or more minute(s)'
# security_policy 'Reset account lockout counter after' do
#  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Reset account lockout counter after.inf}"
#  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{['cb_cis_windows_10']['secedit_database']['name']}"
#  action :configure
# end
