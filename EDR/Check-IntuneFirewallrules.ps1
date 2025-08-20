#Author Jonaxethan
#Date 2023-10-16
#Version 1.0
#Description: This script checks the firewall rules pushed by Intune for Windows Devices

$MDMFirewallRules = Get-NetFirewallRule -PolicyStore "MDM" |  
    Select-Object DisplayName, Enabled, Action, Direction, Profile, Description | 
    Format-Table -AutoSize   

if ($MDMFirewallRules) {
    Write-Host "The following firewall rules are pushed by Intune:" -ForegroundColor Green
    $MDMFirewallRules
} else {
    Write-Host "No firewall rules found in the MDM policy store." -ForegroundColor Yellow
    exit 1
}‚‚
return 0