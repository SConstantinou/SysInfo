function Get-Fan {
<#
.SYNOPSIS

Gets the properties of a fan device in the computer system.

.DESCRIPTION

Gets the properties of a fan device in the computer system
and converts all codes in results into human readable format.

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

System.Array. Get-Fan can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Fan returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Fan

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-Fan -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-Fan

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-Fan -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-fan
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_Fan'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','ActiveCooling','DesiredSpeed','VariableSpeed','Status','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $Fan = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $Fan){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Optimize-Output -Object $Fan -Properties $Properties -DefaultProperties $DefaultProperties
}