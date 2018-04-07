# Windows 10 CIS Benchmark Items - Section 9.3 - Windows Firewall Public Profile

# Ensure 'Windows Firewall: Public: Firewall state' is set to 'On (recommended)'
# Set-NetFirewallProfile -Profile Public -Enabled True

# Ensure 'Windows Firewall: Public: Inbound connections' is set to 'Block (default)'
# Set-NetFirewallProfile -Profile Public -DefaultInboundAction Block

# Ensure 'Windows Firewall: Public: Outbound connections' is set to 'Allow (default)'
# Set-NetFirewallProfile -Profile Public -DefaultOutboundAction Allow

# Ensure 'Windows Firewall: Public: Settings: Display a notification' is set to 'No'
# Set-NetFirewallProfile -Profile Public -NotifyOnListen False

# Ensure 'Windows Firewall: Public: Settings: Apply local firewall rules' is set to 'No'
# Set-NetFirewallProfile -Profile Public -AllowLocalFirewallRules false

# Ensure 'Windows Firewall: Public: Settings: Apply local connection security rules' is set to 'No'
# Set-NetFirewallProfile -Profile Public -AllowLocalFirewallRules false

# Ensure 'Windows Firewall: Public: Logging: Name' is set to '%SYSTEMROOT%\System32\logfiles\firewall\Publicfw.log'
# Set-NetFirewallProfile -Profile Public -LogFileName %SYSTEMROOT%\System32\logfiles\firewall\Publicfw.log

# Ensure 'Windows Firewall: Public: Logging: Size limit (KB)' is set to '16,384 KB or greater'
# Set-NetFirewallProfile -Profile Public -LogMaxSizeKilobytes 20480

# Ensure 'Windows Firewall: Public: Logging: Log dropped packets' is set to 'Yes'
# Set-NetFirewallProfile -Profile Public -LogAllowed True

# Ensure 'Windows Firewall: Public: Logging: Log successful connections' is set to 'Yes'
# Set-NetFirewallProfile -Profile Public -LogBlocked True

powershell_script 'PublicProfile' do
    code <<-EOH
        Start-Transcript -Verbose
        $settings = @{
            'Name'='Public';
            'Enabled'='True';
            'DefaultInboundAction'='Block';
            'DefaultOutBoundAction'='Allow';
            'NotifyOnListen'='False';
            'AllowLocalFirewallRules'='False';
            'AllowLocalIPsecRules'='False';
            'LogFileName'='C:\\Windows\\System32\\logfiles\\firewall\\Publicfw.log';
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
