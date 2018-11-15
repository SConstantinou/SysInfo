function Get-PortableBattery {
<#
.SYNOPSIS

Gets the information related to a portable battery, such as a
notebook computer battery.

.DESCRIPTION

Gets the information related to a portable battery, such as a
notebook computer battery and converts all codes in results into
human readable format.

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

System.Array. Get-PortableBattery can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PortableBattery returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PortableBattery

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-PortableBattery -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-PortableBattery -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-PortableBattery -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-PortableBattery -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-PortableBattery -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-PortableBattery

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-PortableBattery -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-portablebattery
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_PortableBattery'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','BatteryStatus','Chemistry','DesignCapacity','DesignVoltage','Manufacturer','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $PortableBattery = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $PortableBattery){

        $_.Availability = Get-Availability ($_.Availability)
        $_.BatteryStatus = Get-BatteryStatus ($_.BatteryStatus)
        $_.Chemistry = Get-Chemistry ($_.Chemistry)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Optimize-Output -Object $PortableBattery -Properties $Properties -DefaultProperties $DefaultProperties
}