function Get-MotherboardDevice {
<#
.SYNOPSIS

Gets the information about a device that contains the central
components of the Windows computer system.

.DESCRIPTION

Gets the information about a device that contains the central
components of the Windows computer system and converts all
codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-MotherboardDevice can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-MotherboardDevice returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-MotherboardDevice

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName Server1

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-MotherboardDevice -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-MotherboardDevice -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-MotherboardDevice -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-MotherboardDevice

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-MotherboardDevice

.EXAMPLE

PS C:\> "Server1" | Get-MotherboardDevice

.EXAMPLE

PS C:\> "192.168.0.5" | Get-MotherboardDevice

.LINK

https://www.sconstantinou.com/get-motherboarddevice
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_MotherboardDevice).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $MotherboardDevice = Get-CimInstance -ClassName Win32_MotherboardDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $MotherboardDevice = Get-CimInstance -ClassName Win32_MotherboardDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $MotherboardDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $MotherboardDevice
}