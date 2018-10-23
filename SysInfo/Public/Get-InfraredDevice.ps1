function Get-InfraredDevice {
<#
.SYNOPSIS

Gets the information, capabilities and management of an infrared
device.

.DESCRIPTION

Gets the information, capabilities and management of an infrared
device and converts all codes in results into human readable
format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-InfraredDevice can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-InfraredDevice returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-InfraredDevice

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName Server1

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-InfraredDevice -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-InfraredDevice -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-InfraredDevice -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-InfraredDevice

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-InfraredDevice

.EXAMPLE

PS C:\> "Server1" | Get-InfraredDevice

.EXAMPLE

PS C:\> "192.168.0.5" | Get-InfraredDevice

.LINK

https://www.sconstantinou.com/get-infrareddevice
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_InfraredDevice).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $InfraredDevice = Get-CimInstance -ClassName Win32_InfraredDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $InfraredDevice = Get-CimInstance -ClassName Win32_InfraredDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $InfraredDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }

    Write-Output $InfraredDevice
}