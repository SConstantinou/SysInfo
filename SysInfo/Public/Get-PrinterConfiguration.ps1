function Get-PrinterConfiguration {
<#
.SYNOPSIS

Gets the information about the configuration for a printer device.

.DESCRIPTION

Gets the information about the configuration for a printer device
and converts all codes in results into human readable format.
Output includes capabilities such as resolution, color, fonts
and orientation.

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

System.Array. Get-PrinterConfiguration can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PrinterConfiguration returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PrinterConfiguration

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-PrinterConfiguration

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-printerconfiguration
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_PrinterConfiguration'
    [System.Collections.ArrayList]$DefaultProperties = 'PrintQuality','DriverVersion','Name','PaperSize','Caption','Manufacturer','SystemName'

    $AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name

    $PrinterConfiguration = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $PrinterConfiguration){

        $_.Color = Get-Color ($_.Color)
        $_.DitherType = Get-DitherType ($_.DitherType)
        $_.ICMIntent = Get-ICMIntent ($_.ICMIntent)
        $_.ICMMethod = Get-ICMMethod ($_.ICMMethod)
        $_.MediaType = Get-PrinterMediaType ($_.MediaType)
        $_.Orientation = Get-Orientation ($_.Orientation)
        $_.PrintQuality = Get-PrintQuality ($_.PrintQuality)
        $_.TTOption = Get-TTOption ($_.TTOption)
    }

    Optimize-Output -Object $PrinterConfiguration -Properties $Properties -DefaultProperties $DefaultProperties
}