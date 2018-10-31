function Get-Battery {
<#
.SYNOPSIS

Gets the information of a battery connected to the computer
system.

.DESCRIPTION

Gets the information of a battery connected to the computer
system and converts all codes in results into human readable
format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-Battery can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Battery returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Battery

.EXAMPLE

PS C:\> Get-Battery -ComputerName Server1

.EXAMPLE

PS C:\> Get-Battery -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-Battery -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-Battery -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-Battery -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-Battery -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-Battery

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-Battery

.EXAMPLE

PS C:\> "Server1" | Get-Battery

.EXAMPLE

PS C:\> "192.168.0.5" | Get-Battery

.LINK

https://www.sconstantinou.com/get-battery
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_Battery'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $Battery = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $Battery){

        $_.Availability = Get-Availability ($_.Availability)
        $_.BatteryStatus = Get-BatteryStatus ($_.BatteryStatus)
        $_.Chemistry = Get-Chemistry ($_.Chemistry)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Battery
}