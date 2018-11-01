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

.INPUTS

System.Array. Get-NetworkAdapterConfiguration can accept a
string value to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-NetworkAdapterConfiguration returns an
object containing all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName Server1

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-NetworkAdapterConfiguration -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-NetworkAdapterConfiguration -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-NetworkAdapterConfiguration

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-NetworkAdapterConfiguration

.EXAMPLE

PS C:\> "Server1" | Get-NetworkAdapterConfiguration

.EXAMPLE

PS C:\> "192.168.0.5" | Get-NetworkAdapterConfiguration

.EXAMPLE

PS C:\> Get-NetworkAdapterConfiguration -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-networkadapterconfiguration
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_NetworkAdapterConfiguration'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("DatabasePath")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $NetworkAdapterConfiguration = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $NetworkAdapterConfiguration){

        $_.IGMPLevel = Get-IGMPLevel ($_.IGMPLevel)
        $_.IPXFrameType = Get-IPXFrameType ($_.IPXFrameType)
        $_.IPXMediaType = Get-IPXMediaType ($_.IPXMediaType)
        $_.TcpipNetbiosOptions = Get-TcpipNetbiosOption ($_.TcpipNetbiosOptions)
    }

    Write-Output $NetworkAdapterConfiguration
}