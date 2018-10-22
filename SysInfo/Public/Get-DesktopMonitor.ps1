function Get-DesktopMonitor {
<#
.SYNOPSIS

Gets the type of monitor or display device attached to the
computer system.

.DESCRIPTION

Gets the type of monitor or display device attached to the
computer system and converts all codes in results into human
readable format. Hardware that is not compatible with Windows
Display Driver Model (WDDM) returns inaccurate property values.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-DesktopMonitor can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-DesktopMonitor returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-DesktopMonitor

.EXAMPLE

PS C:\> Get-DesktopMonitor -ComputerName Server1

.EXAMPLE

PS C:\> Get-DesktopMonitor -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-DesktopMonitor -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-DesktopMonitor -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-DesktopMonitor -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-DesktopMonitor -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-DesktopMonitor

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-DesktopMonitor

.EXAMPLE

PS C:\> "Server1" | Get-DesktopMonitor

.EXAMPLE

PS C:\> "192.168.0.5" | Get-DesktopMonitor

.LINK

https://www.sconstantinou.com/get-desktopmonitor
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_DesktopMonitor).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $DesktopMonitor = Get-CimInstance -ClassName Win32_DesktopMonitor -Property $Properties | Select-Object $Properties
    }
    else{

        $DesktopMonitor = Get-CimInstance -ClassName Win32_DesktopMonitor -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DesktopMonitor){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.DisplayType = Get-DisplayType ($_.DisplayType)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $DesktopMonitor
}