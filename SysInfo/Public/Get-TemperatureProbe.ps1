function Get-TemperatureProbe {
<#
.SYNOPSIS

Gets the properties of a temperature sensor
(electronic thermometer).

.DESCRIPTION

Gets the properties of a temperature sensor
(electronic thermometer) and converts all codes
in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-TemperatureProbe can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-TemperatureProbe returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-TemperatureProbe

.EXAMPLE

PS C:\> Get-TemperatureProbe -ComputerName Server1

.EXAMPLE

PS C:\> Get-TemperatureProbe -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-TemperatureProbe -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-TemperatureProbe -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-TemperatureProbe -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-TemperatureProbe -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-TemperatureProbe

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-TemperatureProbe

.EXAMPLE

PS C:\> "Server1" | Get-TemperatureProbe

.EXAMPLE

PS C:\> "192.168.0.5" | Get-TemperatureProbe

.LINK

https://www.sconstantinou.com/get-temperatureprobe
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_TemperatureProbe).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $TemperatureProbe = Get-CimInstance -ClassName Win32_TemperatureProbe -Property $Properties | Select-Object $Properties
    }
    else{

        $TemperatureProbe = Get-CimInstance -ClassName Win32_TemperatureProbe -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $TemperatureProbe){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $TemperatureProbe
}