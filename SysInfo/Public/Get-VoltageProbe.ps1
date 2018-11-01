function Get-VoltageProbe {
<#
.SYNOPSIS

Gets the information about the properties of a voltage sensor
(electronic voltmeter).

.DESCRIPTION

Gets the information about the properties of a voltage sensor
(electronic voltmeter) and converts all codes in results into
human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-VoltageProbe can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-VoltageProbe returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-VoltageProbe

.EXAMPLE

PS C:\> Get-VoltageProbe -ComputerName Server1

.EXAMPLE

PS C:\> Get-VoltageProbe -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-VoltageProbe -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-VoltageProbe -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-VoltageProbe -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-VoltageProbe -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-VoltageProbe

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-VoltageProbe

.EXAMPLE

PS C:\> "Server1" | Get-VoltageProbe

.EXAMPLE

PS C:\> "192.168.0.5" | Get-VoltageProbe

.EXAMPLE

PS C:\> Get-VoltageProbe -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-voltageprobe
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_VoltageProbe'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $VoltageProbe = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $VoltageProbe){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $VoltageProbe
}