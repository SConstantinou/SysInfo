function Get-InfraredDevice {
<#
.SYNOPSIS

Gets the information, capabilities and management of an infrared
device.

.DESCRIPTION

Gets the information, capabilities and management of an infrared
device and converts all codes in results into human readable
format.

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

System.Array. Get-InfraredDevice can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-InfraredDevice returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-InfraredDevice

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-InfraredDevice

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-infrareddevice
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_InfraredDevice'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','Status','Manufacturer','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $InfraredDevice = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $InfraredDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }

    Optimize-Output -Object $InfraredDevice -Properties $Properties -DefaultProperties $DefaultProperties
}