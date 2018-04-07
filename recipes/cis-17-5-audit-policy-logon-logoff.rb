# Windows 10 CIS Benchmark Items - Section 17.5 - Advanced Audit Policy, Logon/Logoff

# 17.5.1 (L1) Ensure 'Audit Account Lockout' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Account Lockout" /success:enable /failure:enable'
  action :run
end

# 17.5.2 (L1) Ensure 'Audit Group Membership' is set to 'Success'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Group Membership" /success:enable /failure:disable'
  action :run
end

# 17.5.3 (L1) Ensure 'Audit Logoff' is set to 'Success'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Logoff" /success:enable /failure:disable'
  action :run
end

# 17.5.4 (L1) Ensure 'Audit Logon' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Logon" /success:enable /failure:enable'
  action :run
end

# 17.5.5 (L1) Ensure 'Audit Other Logon/Logoff Events' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable'
  action :run
end

# 17.5.6 (L1) Ensure 'Audit Special Logon' is set to 'Success'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Special Logon" /success:enable /failure:disable'
  action :run
end
