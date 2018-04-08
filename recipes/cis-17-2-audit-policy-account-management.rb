# Windows 10 CIS Benchmark Items - Section 17.2 - Advanced Audit Policy, Account Management

# 17.2.1 (L1) Ensure 'Audit Application Group Management' is set to 'Success and Failure'
# AuditPol execute block
execute 'Application Group Management' do
  command 'auditpol /set /subcategory:"Application Group Management" /success:enable /failure:enable'
  action :run
end

# 17.2.2 (L1) Ensure 'Audit Computer Account Management' is set to 'Success and Failure'
# AuditPol execute block
execute 'Computer Account Management' do
  command 'auditpol /set /subcategory:"Computer Account Management" /success:enable /failure:enable'
  action :run
end

# 17.2.3 (L1) Ensure 'Audit Other Account Management Events' is set to 'Success and Failure'
# AuditPol execute block
execute 'Other Account Management Events' do
  command 'auditpol /set /subcategory:"Other Account Management Events" /success:enable /failure:enable'
  action :run
end

# 17.2.4 (L1) Ensure 'Audit Security Group Management' is set to 'Success and Failure'
# AuditPol execute block
execute 'Security Group Management' do
  command 'auditpol /set /subcategory:"Security Group Management" /success:enable /failure:enable'
  action :run
end

# 17.2.5 (L1) Ensure 'Audit User Account Management' is set to 'Success and Failure'
# AuditPol execute block
execute 'User Account Management' do
  command 'auditpol /set /subcategory:"User Account Management" /success:enable /failure:enable'
  action :run
end
