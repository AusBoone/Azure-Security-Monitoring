# Check-InsecureConfigurations.ps1
# Description: Checks for insecure configurations in Azure web apps, such as not enforcing HTTPS.

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

# Function to check for insecure configurations in Azure web apps
function Check-InsecureConfigurations {
    # Retrieve all web apps
    $webApps = Get-AzWebApp
    
    # Iterate through each web app
    foreach ($webApp in $webApps) {
        # Check if HTTPS is not enforced
        if ($webApp.HttpsOnly -eq $false) {
            # Send an alert for the insecure configuration
            Send-Alert -message "Web App $($webApp.Name) is not configured for HTTPS only"
        }
    }
}

# Run the function to check for insecure configurations
Check-InsecureConfigurations
