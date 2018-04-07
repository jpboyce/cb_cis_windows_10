# Windows 10 CIS Benchmark Items - Section 9.2 - Windows Firewall Private Profile

# Ensure 'Windows Firewall: Private: Firewall state' is set to 'On (recommended)'
# Set-NetFirewallProfile -Profile Private -Enabled True

# Ensure 'Windows Firewall: Private: Inbound connections' is set to 'Block (default)'
# Set-NetFirewallProfile -Profile Private -DefaultInboundAction Block

# Ensure 'Windows Firewall: Private: Outbound connections' is set to 'Allow (default)'
# Set-NetFirewallProfile -Profile Private -DefaultOutboundAction Allow

# Ensure 'Windows Firewall: Private: Settings: Display a notification' is set to 'No'
# Set-NetFirewallProfile -Profile Private -NotifyOnListen False

# Ensure 'Windows Firewall: Private: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\Privatefw.log'
# Set-NetFirewallProfile -Profile Private -LogFileName %SYSTEMROOT%\System32\logfiles\firewall\Privatefw.log

# Ensure 'Windows Firewall: Private: Logging: Size limit (KB)' is set to '16,384 KB or greater'
# Set-NetFirewallProfile -Profile Private -LogMaxSizeKilobytes 20480

# Ensure 'Windows Firewall: Private: Logging: Log dropped packets' is set to 'Yes'
# Set-NetFirewallProfile -Profile Private -LogAllowed True

# Ensure 'Windows Firewall: Private: Logging: Log successful connections' is set to 'Yes'
# Set-NetFirewallProfile -Profile Private -LogBlocked True

powershell_script 'PrivateProfile' do
    code <<-EOH
        Start-Transcript -Verbose
        $settings = @{
            'Name'='Private';
            'Enabled'='True';
            'DefaultInboundAction'='Block';
            'DefaultOutBoundAction'='Allow';
            'NotifyOnListen'='False';
            'LogFileName'='C:\\Windows\\System32\\logfiles\\firewall\\privatefw.log';
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
