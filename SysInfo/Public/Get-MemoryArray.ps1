function Get-MemoryArray {
<#
.SYNOPSIS

Gets the properties of the computer system memory array and
mapped addresses.

.DESCRIPTION

Gets the properties of the computer system memory array and
mapped addresses and converts all codes in results into human
readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-MemoryArray can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-MemoryArray returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-MemoryArray

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName Server1

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-MemoryArray -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-MemoryArray -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-MemoryArray

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-MemoryArray

.EXAMPLE

PS C:\> "Server1" | Get-MemoryArray

.EXAMPLE

PS C:\> "192.168.0.5" | Get-MemoryArray

.LINK

https://www.sconstantinou.com/get-memoryarray
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_MemoryArray).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $MemoryArray = Get-CimInstance -ClassName Win32_MemoryArray -Property $Properties | Select-Object $Properties
    }
    else{

        $MemoryArray = Get-CimInstance -ClassName Win32_MemoryArray -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $MemoryArray){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ErrorAccess = Get-ErrorAccess ($_.ErrorAccess)
        $_.ErrorDataOrder = Get-ErrorDataOrder ($_.ErrorDataOrder)
        $_.ErrorGranularity = Get-ErrorGranularity ($_.ErrorGranularity)
        $_.ErrorInfo = Get-ErrorInfo ($_.ErrorInfo)
    }

    Write-Output $MemoryArray
}