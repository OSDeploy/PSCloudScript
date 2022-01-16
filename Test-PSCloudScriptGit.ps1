function Test-PSCloudScriptGit
{
    [CmdletBinding()]
    param()
    Write-Host 'This is a PowerShell function in a GitHub Repo'
    Write-Verbose 'This is a PowerShell function in a GitHub Repo with the Verbose parameter'
}
Write-Host 'Test-PSCloudScriptGit function ' -ForegroundColor Green