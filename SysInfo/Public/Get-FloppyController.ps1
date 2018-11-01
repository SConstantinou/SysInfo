function Get-FloppyController {
<#
.SYNOPSIS

Gets the capabilities and management capacity of a floppy
disk drive controller.

.DESCRIPTION

Gets the capabilities and management capacity of a floppy
disk drive controller and converts all codes in results into
human readable format. Get-FloppyController is not available
for use as of Windows 10 and Windows Server 2016.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-FloppyController can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-FloppyController returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-FloppyController

.EXAMPLE

PS C:\> Get-FloppyController -ComputerName Server1

.EXAMPLE

PS C:\> Get-FloppyController -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-FloppyController -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-FloppyController -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-FloppyController -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-FloppyController -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-FloppyController

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-FloppyController

.EXAMPLE

PS C:\> "Server1" | Get-FloppyController

.EXAMPLE

PS C:\> "192.168.0.5" | Get-FloppyController

.EXAMPLE

PS C:\> Get-FloppyController -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-floppycontroller
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_FloppyController'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $FloppyController = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $FloppyController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }

    Write-Output $FloppyController
}