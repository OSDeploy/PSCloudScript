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
    Set-ExecutionPolicy RemoteSigned -Force
    Install-Module AutopilotOOBE -Force
    Install-Script -Name Get-WindowsAutoPilotInfo -Force
    Write-Verbose 'Run AutopilotOOBE in the new PowerShell window' -Verbose
    Start-Sleep -Seconds 5
    Start-Process PowerShell.exe
}