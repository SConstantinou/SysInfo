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

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-FloppyDrive can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-FloppyDrive returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-FloppyDrive

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-FloppyDrive

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-FloppyDrive -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-floppydrive
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_FloppyDrive'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','Manufacturer','Status','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $FloppyDrive = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

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

    Optimize-Output -Object $FloppyDrive -Properties $Properties -DefaultProperties $DefaultProperties
}