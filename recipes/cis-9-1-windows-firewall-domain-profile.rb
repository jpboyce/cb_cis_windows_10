# Windows 10 CIS Benchmark Items - Section 9.1 - Windows Firewall Domain Profile

# Ensure 'Windows Firewall: Domain: Firewall state' is set to 'On (recommended)'
# Set-NetFirewallProfile -Profile Domain -Enabled True

# Ensure 'Windows Firewall: Domain: Inbound connections' is set to 'Block (default)'
# Set-NetFirewallProfile -Profile Domain -DefaultInboundAction Block

# Ensure 'Windows Firewall: Domain: Outbound connections' is set to 'Allow (default)'
# Set-NetFirewallProfile -Profile Domain -DefaultOutboundAction Allow

# Ensure 'Windows Firewall: Domain: Settings: Display a notification' is set to 'No'
# Set-NetFirewallProfile -Profile Domain -NotifyOnListen False

# Ensure 'Windows Firewall: Domain: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\domainfw.log'
# Set-NetFirewallProfile -Profile Domain -LogFileName %SYSTEMROOT%\System32\logfiles\firewall\domainfw.log

# Ensure 'Windows Firewall: Domain: Logging: Size limit (KB)' is set to '16,384 KB or greater'
# Set-NetFirewallProfile -Profile Domain -LogMaxSizeKilobytes 20480

# Ensure 'Windows Firewall: Domain: Logging: Log dropped packets' is set to 'Yes'
# Set-NetFirewallProfile -Profile Domain -LogAllowed True

# Ensure 'Windows Firewall: Domain: Logging: Log successful connections' is set to 'Yes'
# Set-NetFirewallProfile -Profile Domain -LogBlocked True

powershell_script 'DomainProfile' do
    code <<-EOH
        Start-Transcript -Verbose
        $settings = @{
            'Name'='Domain';
            'Enabled'='True';
            'DefaultInboundAction'='Block';
            'DefaultOutBoundAction'='Allow';
            'NotifyOnListen'='False';
            'LogFileName'='C:\\Windows\\System32\\logfiles\\firewall\\domainfw.log';
            'LogMaxSizeKilobytes'='20480';
            'LogAllowed'='True';
            'LogBlocked'='True'
            }

        $lines = ($settings | out-string) -split "`n"
        foreach($line in $lines) {
            write-warning $line
        }
        Set-NetFirewallProfile @settings -Verbose

        Stop-Transcript -Verbose
    EOH
end
