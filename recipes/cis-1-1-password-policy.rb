# Windows 10 CIS Benchmark Items - Section 1.1 - Password Policyx

# Enforce password history is set to '24 or more password(s)'
security_policy 'Enforce password history' do
  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Enforce_password_history.inf"
  log_location "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Enforce_password_history.log"
  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{node['cb_cis_windows_10']['secedit_database']['name']}"
  action :configure
end

# Ensure 'Maximum password age' is set to '60 or fewer days, but not 0'
security_policy 'Maximum password age' do
  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Maximum_password_age.inf"
  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{node['cb_cis_windows_10']['secedit_database']['name']}"
  action :configure
end

# Ensure 'Minimum password age' is set to '1 or more day(s)'
security_policy 'Minimum password age' do
  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Minimum_password_age.inf"
  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{node['cb_cis_windows_10']['secedit_database']['name']}"
  action :configure
end

# Ensure 'Minimum password length' is set to '14 or more character(s)'
security_policy 'Minimum password length' do
  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Minimum_password_length.inf"
  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{node['cb_cis_windows_10']['secedit_database']['name']}"
  action :configure
end

# Ensure 'Password must meet complexity requirements' is set to 'Enabled'
security_policy 'Password must meet complexity requirements' do
  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Password_must_meet_complexity_requirements.inf"
  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{node['cb_cis_windows_10']['secedit_database']['name']}"
  action :configure
end

# Ensure 'Store passwords using reversible encryption' is set to 'Disabled'
security_policy 'Store passwords using reversible encryption' do
  policy_template "#{node['cb_cis_windows_10']['secedit_template']['location']}\\Store_passwords_using_reversible_encryptiony.inf"
  database "#{node['cb_cis_windows_10']['secedit_database']['location']}\\#{node['cb_cis_windows_10']['secedit_database']['name']}"
  action :configure
end
