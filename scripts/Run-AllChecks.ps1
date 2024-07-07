# Run-AllChecks.ps1
# Description: Runs all security checks and alerts administrators of potential vulnerabilities or compliance issues.

# Import the Az module to manage Azure resources
Import-Module Az

# Source all the individual check scripts
. ./scripts/Check-OpenPorts.ps1
. ./scripts/Check-InsecureConfigurations.ps1
. ./scripts/Check-VMUpdates.ps1
. ./scripts/Check-SQLTDE.ps1
. ./scripts/Check-StorageSecureTransfer.ps1

# Run all the security check functions
Check-OpenPorts
Check-InsecureConfigurations
Check-VMUpdates
Check-SQLTDE
Check-StorageSecureTransfer
