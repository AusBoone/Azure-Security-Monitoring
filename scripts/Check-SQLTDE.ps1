# Check-SQLTDE.ps1
# Description: Checks if Transparent Data Encryption (TDE) is enabled on Azure SQL databases.

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

# Function to check if Transparent Data Encryption (TDE) is enabled on Azure SQL databases
function Check-SQLTDE {
    # Retrieve all SQL servers
    $sqlServers = Get-AzSqlServer
    
    # Iterate through each SQL server
    foreach ($server in $sqlServers) {
        # Retrieve all databases on the SQL server
        $databases = Get-AzSqlDatabase -ServerName $server.ServerName -ResourceGroupName $server.ResourceGroupName
        
        # Iterate through each database
        foreach ($db in $databases) {
            # Retrieve the TDE status of the database
            $tdeStatus = Get-AzSqlDatabaseTransparentDataEncryption -ResourceGroupName $server.ResourceGroupName -ServerName $server.ServerName -DatabaseName $db.DatabaseName
            
            # Check if TDE is not enabled
            if ($tdeStatus.State -ne "Enabled") {
                # Send an alert for the database without TDE
                Send-Alert -message "SQL Database $($db.DatabaseName) on server $($server.ServerName) does not have TDE enabled"
            }
        }
    }
}

# Run the function to check if TDE is enabled on SQL databases
Check-SQLTDE
