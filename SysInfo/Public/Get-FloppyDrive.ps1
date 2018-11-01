function Get-FloppyDrive {
<#
.SYNOPSIS

Gets the information and functions of a floppy disk drive.

.DESCRIPTION

Gets the information and functions of a floppy disk drive
and converts all codes in results into human readable format.
Get-FloppyDrive is not available for use as of Windows 10
and Windows Server 2016.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-FloppyDrive can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-FloppyDrive returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-FloppyDrive

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-FloppyDrive -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-FloppyDrive -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-FloppyDrive

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-FloppyDrive

.EXAMPLE

PS C:\> "Server1" | Get-FloppyDrive

.EXAMPLE

PS C:\> "192.168.0.5" | Get-FloppyDrive

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-floppydrive
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_FloppyDrive'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $FloppyDrive = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $FloppyDrive){

        if ($_.DefaultBlockSize -ge 1KB) {

            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "DefaultBlockSizeKB" -Value "" -Force
        }

        if ($_.MaxBlockSize -ge 1KB) {

            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "MaxBlockSizeKB" -Value "" -Force
        }

        if (($_.MaxMediaSize * 1KB) -ge 1MB) {

            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeMB" -Value "" -Force
        }

        if ($_.MinBlockSize -ge 1KB) {

            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "MinBlockSizeKB" -Value "" -Force
        }

    }

    foreach ($_ in $FloppyDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "DefaultBlockSizeKB"){$_.DefaultBlockSizeKB = Get-SizeKB ($_.DefaultBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxBlockSizeKB"){$_.MaxBlockSizeKB = Get-SizeKB ($_.MaxBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeMB"){$_.MaxMediaSizeMB = Get-SizeMB ($_.MaxMediaSize)}
        if ($_.PSObject.Properties.Name -match "MinBlockSizeKB"){$_.MinBlockSizeKB = Get-SizeKB ($_.MinBlockSize)}
    }

    Write-Output $FloppyDrive
}