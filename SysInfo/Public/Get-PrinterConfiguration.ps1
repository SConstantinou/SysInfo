function Get-PrinterConfiguration {
<#
.SYNOPSIS

Gets the information about the configuration for a printer device.

.DESCRIPTION

Gets the information about the configuration for a printer device
and converts all codes in results into human readable format.
Output includes capabilities such as resolution, color, fonts
and orientation.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-PrinterConfiguration can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PrinterConfiguration returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PrinterConfiguration

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName Server1

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-PrinterConfiguration -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-PrinterConfiguration -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-PrinterConfiguration -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-PrinterConfiguration

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-PrinterConfiguration

.EXAMPLE

PS C:\> "Server1" | Get-PrinterConfiguration

.EXAMPLE

PS C:\> "192.168.0.5" | Get-PrinterConfiguration

.LINK

https://www.sconstantinou.com/get-printerconfiguration
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PrinterConfiguration).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PrinterConfiguration = Get-CimInstance -ClassName Win32_PrinterConfiguration -Property $Properties | Select-Object $Properties
    }
    else{

        $PrinterConfiguration = Get-CimInstance -ClassName Win32_PrinterConfiguration -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PrinterConfiguration){

        $_.Color = Get-Color ($_.Color)
        $_.DitherType = Get-DitherType ($_.DitherType)
        $_.ICMIntent = Get-ICMIntent ($_.ICMIntent)
        $_.ICMMethod = Get-ICMMethod ($_.ICMMethod)
        $_.MediaType = Get-PrinterMediaType ($_.MediaType)
        $_.Orientation = Get-Orientation ($_.Orientation)
        $_.PrintQuality = Get-PrintQuality ($_.PrintQuality)
        $_.TTOption = Get-TTOption ($_.TTOption)
    }

    Write-Output $PrinterConfiguration
}