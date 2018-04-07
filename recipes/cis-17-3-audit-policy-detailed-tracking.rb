# Windows 10 CIS Benchmark Items - Section 17.3 - Advanced Audit Policy, Detailed Tracking

# 17.3.1 (L1) Ensure 'Audit PNP Activity' is set to 'Success'
=begin
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:{GUID}|SubCatName /success:enable|disable /failure:enable|disable'
  action :run
end
=end

# 17.3.2 (L1) Ensure 'Audit Process Creation' is set to 'Success'
# AuditPol execute block
execute 'name' do
  command 'auditpol /set /subcategory:"Process Creation" /success:enable /failure:disable'
  action :run
end
