function Get-SCSIControllerSysInfo {
<#
.SYNOPSIS

Gets the information of a SCSI controller on a computer
system running Windows.

.DESCRIPTION

Gets the information of a SCSI controller on a computer
system running Windows and converts all codes in results
into human readable format.

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

System.Array. Get-SCSIControllerSysInfo can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-SCSIControllerSysInfo returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-SCSIControllerSysInfo

This command gets the information from local system

.EXAMPLE

PS C:\> Get-SCSIControllerSysInfo -ComputerName Server1

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-SCSIControllerSysInfo -ComputerName "192.168.0.5"

This command gets the information from remote system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-SCSIControllerSysInfo -ComputerName Server1,Server2,Server3

This command gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-SCSIControllerSysInfo -ComputerName Server1 -Properties Name,Status

This command gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-SCSIControllerSysInfo -ComputerName Server1 -Properties *

This command gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-SCSIControllerSysInfo

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-SCSIControllerSysInfo -ComputerName Server1 -Protocol DCOM

This command gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/Get-SCSIControllerSysInfo
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_SCSIController'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','DriverName','Status','StatusInfo','ProtocolSupported','Manufacturer','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $SCSIController = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $SCSIController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.ProtectionManagement = Get-ProtectionManagement ($_.ProtectionManagement)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Optimize-Output -Object $SCSIController -Properties $Properties -DefaultProperties $DefaultProperties
}