function Get-1394Controller {
<#
.SYNOPSIS

Gets the capabilities and management of a 1394 controller.

.DESCRIPTION

Gets the capabilities and management of a 1394 controller
and converts all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-1394Controller can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-1394Controller returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-1394Controller

.EXAMPLE

PS C:\> Get-1394Controller -ComputerName Server1

.EXAMPLE

PS C:\> Get-1394Controller -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-1394Controller -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-1394Controller -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-1394Controller -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-1394Controller -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-1394Controller

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-1394Controller

.EXAMPLE

PS C:\> "Server1" | Get-1394Controller

.EXAMPLE

PS C:\> "192.168.0.5" | Get-1394Controller

.LINK

https://www.sconstantinou.com/get-1394controller
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_1394Controller'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $1394Controller = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $1394Controller){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }

    Write-Output $1394Controller
}