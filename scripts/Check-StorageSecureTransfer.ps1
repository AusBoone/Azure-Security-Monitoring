# Check-StorageSecureTransfer.ps1
# Description: Checks if secure transfer is enabled on Azure storage accounts.

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

# Function to check if secure transfer is enabled on Azure storage accounts
function Check-StorageSecureTransfer {
    # Retrieve all storage accounts
    $storageAccounts = Get-AzStorageAccount
    
    # Iterate through each storage account
    foreach ($account in $storageAccounts) {
        # Check if secure transfer is not enabled
        if ($account.EnableHttpsTrafficOnly -eq $false) {
            # Send an alert for the storage account without secure transfer
            Send-Alert -message "Storage account $($account.StorageAccountName) does not have secure transfer enabled"
        }
    }
}

# Run the function to check if secure transfer is enabled on storage accounts
Check-StorageSecureTransfer
