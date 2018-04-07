# Windows 10 CIS Benchmark Items - Section 17.9 - Advanced Audit Policy, System

# 17.9.1 (L1) Ensure 'Audit IPsec Driver' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"IPsec Driver" /success:enable /failure:enable'
  action :run
end

# 17.9.2 (L1) Ensure 'Audit Other System Events' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Other System Events" /success:enable /failure:enable'
  action :run
end

# 17.9.3 (L1) Ensure 'Audit Security State Change' is set to 'Success'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Security State Change" /success:enable /failure:disable'
  action :run
end

# 17.9.4 (L1) Ensure 'Audit Security System Extension' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Security System Extension" /success:enable /failure:enable'
  action :run
end

# 17.9.5 (L1) Ensure 'Audit System Integrity' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"System Integrity" /success:enable /failure:enable'
  action :run
end
