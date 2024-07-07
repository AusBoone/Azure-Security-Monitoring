# Check-OpenPorts.ps1
# Description: Checks for open ports in Network Security Groups (NSGs) in Azure and sends alerts for potential security risks.

# Import the Az module to manage Azure resources
Import-Module Az

# Function to send alert notifications
# @param [string]$message - The alert message to be sent
function Send-Alert {
    param (
        [string]$message
    )
    # Placeholder for alerting mechanism, e.g., send email, log to file, etc.
    Write-Output $message
}

# Function to check for open ports in Network Security Groups (NSGs)
function Check-OpenPorts {
    # Retrieve all Network Security Groups
    $nsgs = Get-AzNetworkSecurityGroup
    
    # Iterate through each NSG
    foreach ($nsg in $nsgs) {
        # Iterate through each security rule in the NSG
        foreach ($rule in $nsg.SecurityRules) {
            # Check if the rule is for inbound traffic and allows access
            if ($rule.Direction -eq "Inbound" -and $rule.Access -eq "Allow") {
                # Check if the rule allows all ports or specific high-risk ports (e.g., 80 for HTTP, 22 for SSH)
                if ($rule.DestinationPortRange -eq "*" -or $rule.DestinationPortRange -in @("80", "22")) {
                    # Send an alert for the open port
                    Send-Alert -message "Open port $($rule.DestinationPortRange) detected in NSG $($nsg.Name)"
                }
            }
        }
    }
}

# Run the function to check for open ports
Check-OpenPorts
