'PSCloudScript for AutopilotOOBE'
'iex (irm autopilotoobe.pscloudscript.com)'

if ($env:SystemDrive -eq 'X:')
{
    Write-Warning 'This PSCloudScript cannot be run from WinPE'
    Start-Sleep -Seconds 5
}
elseif ($env:UserName -ne 'defaultuser0')
{
    Write-Warning 'This PSCloudScript must be run from OOBE'
    Start-Sleep -Seconds 5
}
else
{
    if (Get-ExecutionPolicy -ne 'RemoteSigned')
    {
        Write-Verbose -Verbose 'Set PowerShell ExecutionPolicy to RemoteSigned'
        Set-ExecutionPolicy RemoteSigned -Force
    }
    if (-not (Get-PackageProvider | Where-Object {$_.Name -eq 'NuGet'}))
    {
        Write-Verbose -Verbose 'Installing PackageProvider NuGet'
        Install-PackageProvider -Name NuGet -Force
    }

    if ((Get-Module PowerShellGet).version -lt [System.Version]'2.2.5.0')
    {
        Write-Verbose -Verbose 'Installing PowerShell Module PowerShellGet'
        Install-Module PowerShellGet -Force
    }
    if ((Get-Module PackageManagement).version -lt [System.Version]'1.4.7.0')
    {
        Write-Verbose -Verbose 'Installing PowerShell Module PackageManagement'
        Install-Module PackageManagement -Force
    }
    Write-Verbose -Verbose 'Installing PowerShell Module AutopilotOOBE'
    Install-Module AutopilotOOBE -Force

    
    Write-Verbose -Verbose 'Installing PowerShell Script Get-WindowsAutoPilotInfo'
    Install-Script -Name Get-WindowsAutoPilotInfo -Force

    Write-Verbose 'Run AutopilotOOBE in the new PowerShell window' -Verbose
    Start-Sleep -Seconds 5
    Start-Process PowerShell.exe
}