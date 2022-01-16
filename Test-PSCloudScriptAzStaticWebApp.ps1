function Test-PSCloudScriptAzStaticWebApp
{
    [CmdletBinding()]
    param()
    Write-Host 'This is a PowerShell function in a GitHub Repo pushed to an Azure Static Web App'
    Write-Verbose 'This is a PowerShell function in a GitHub Repo pushed to an Azure Static Web App with the Verbose parameter'
}
Write-Host 'Test-PSCloudScriptAzStaticWebApp function is added to this PowerShell session' -ForegroundColor Green