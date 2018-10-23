function Get-PointingDevice {
<#
.SYNOPSIS

Gets the information about an input device used to point to and
select regions on the display of a computer system running Windows.

.DESCRIPTION

Gets the information about an input device used to point to and
select regions on the display of a computer system running Windows
and converts all codes in results into human readable format.
Output includes any device used to manipulate a pointer, or point
to the display on a computer system running Windows

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-PointingDevice can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PointingDevice returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PointingDevice

.EXAMPLE

PS C:\> Get-PointingDevice -ComputerName Server1

.EXAMPLE

PS C:\> Get-PointingDevice -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-PointingDevice -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-PointingDevice -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-PointingDevice -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-PointingDevice -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-PointingDevice

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-PointingDevice

.EXAMPLE

PS C:\> "Server1" | Get-PointingDevice

.EXAMPLE

PS C:\> "192.168.0.5" | Get-PointingDevice

.LINK

https://www.sconstantinou.com/get-pointingdevice
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_PointingDevice).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $PointingDevice = Get-CimInstance -ClassName Win32_PointingDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $PointingDevice = Get-CimInstance -ClassName Win32_PointingDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PointingDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.Handedness = Get-Handedness ($_.Handedness)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.DeviceInterface = Get-DeviceInterface ($_.DeviceInterface)
        $_.PointingType = Get-PointingType ($_.PointingType)
    }

    Write-Output $PointingDevice
}