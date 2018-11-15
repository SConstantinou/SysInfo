function Get-NetworkAdapterConfiguration {
<#
.SYNOPSIS

Gets the attributes and behaviors of a network adapter.

.DESCRIPTION

Gets the attributes and behaviors of a network adapter
and converts all codes in results into human readable format.
Get-NetworkAdapterConfiguration includes extra properties that
are related to the management of the TCP/IP protocol and are
independent from the network adapter.

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

System.Array. Get-NetworkAdapterConfiguration can accept a
string value to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-NetworkAdapterConfiguration returns an
object containing all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\>  Get-NetworkAdapterConfiguration -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties

.EXAMPLE

PS C:\>  Get-NetworkAdapterConfiguration -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-NetworkAdapterConfiguration

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-networkadapterconfiguration
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_NetworkAdapterConfiguration'
    [System.Collections.ArrayList]$DefaultProperties = 'ServiceName','DHCPEnabled','Index','Description','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("DatabasePath")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $NetworkAdapterConfiguration = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $NetworkAdapterConfiguration){

        $_.IGMPLevel = Get-IGMPLevel ($_.IGMPLevel)
        $_.IPXFrameType = Get-IPXFrameType ($_.IPXFrameType)
        $_.IPXMediaType = Get-IPXMediaType ($_.IPXMediaType)
        $_.TcpipNetbiosOptions = Get-TcpipNetbiosOption ($_.TcpipNetbiosOptions)
    }

    Optimize-Output -Object $NetworkAdapterConfiguration -Properties $Properties -DefaultProperties $DefaultProperties
}