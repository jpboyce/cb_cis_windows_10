# Windows 10 CIS Benchmark Items - Section 17.9 - Advanced Audit Policy, System

# 17.8.1 (L1) Ensure 'Audit Sensitive Privilege Use' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Sensitive Privilege Use" /success:enable /failure:enable'
  action :run
end
