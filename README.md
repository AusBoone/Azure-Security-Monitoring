# Azure Security Monitoring

A PowerShell tool for monitoring Azure security configurations and alerting administrators to potential vulnerabilities or compliance issues.

## Features
- Checks for open ports in Network Security Groups (NSGs)
- Verifies that web apps are configured for HTTPS only
- Ensures VMs are up-to-date with security patches
- Confirms SQL databases have Transparent Data Encryption (TDE) enabled
- Validates that storage accounts have secure transfer enabled

## Usage
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/AzureSecurityMonitoring.git
    cd AzureSecurityMonitoring
    ```

2. Run the main script to perform all checks:
    ```powershell
    .\scripts\Run-AllChecks.ps1
    ```

## Requirements
- Azure PowerShell module (`Az`)

## Contributing
Contributions are welcome!
