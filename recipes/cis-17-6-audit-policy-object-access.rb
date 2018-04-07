# Windows 10 CIS Benchmark Items - Section 17.6 - Advanced Audit Policy, Object Access

# 17.6.1 (L1) Ensure 'Audit Removable Storage' is set to 'Success and Failure'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Removable Storage" /success:enable /failure:enable'
  action :run
end
