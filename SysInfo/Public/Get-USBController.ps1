function Get-USBController {
<#
.SYNOPSIS

Gets the information about the capabilities of a universal
serial bus (USB) controller.

.DESCRIPTION

Gets the information about the capabilities of a universal
serial bus (USB) controller and converts all codes in
results into human readable format.

.PARAMETER ComputerName

Specifies the computer name or IP Address of the system that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-USBController can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-USBController returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-USBController

.EXAMPLE

PS C:\> Get-USBController -ComputerName Server1

.EXAMPLE

PS C:\> Get-USBController -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-USBController -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-USBController -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-USBController -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-USBController -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-USBController

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-USBController

.EXAMPLE

PS C:\> "Server1" | Get-USBController

.EXAMPLE

PS C:\> "192.168.0.5" | Get-USBController

.EXAMPLE

PS C:\> Get-USBController -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-usbcontroller
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_USBController'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $USBController = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $USBController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $USBController
}