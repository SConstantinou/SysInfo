function Get-IDEController {
<#
.SYNOPSIS

Gets the information and capabilities of an integrated device
electronics (IDE) controller device.

.DESCRIPTION

Gets the information and capabilities of an integrated device
electronics (IDE) controller device and converts
all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-IDEController can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-IDEController returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-IDEController

.EXAMPLE

PS C:\> Get-IDEController -ComputerName Server1

.EXAMPLE

PS C:\> Get-IDEController -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-IDEController -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-IDEController -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-IDEController -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-IDEController -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-IDEController

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-IDEController

.EXAMPLE

PS C:\> "Server1" | Get-IDEController

.EXAMPLE

PS C:\> "192.168.0.5" | Get-IDEController

.LINK

https://www.sconstantinou.com/get-idecontroller
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_IDEController).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $IDEController = Get-CimInstance -ClassName Win32_IDEController -Property $Properties | Select-Object $Properties
    }
    else{

        $IDEController = Get-CimInstance -ClassName Win32_IDEController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $IDEController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }

    Write-Output $IDEController
}