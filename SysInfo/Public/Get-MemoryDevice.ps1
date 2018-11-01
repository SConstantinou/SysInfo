Function Get-MemoryDevice {
<#
.SYNOPSIS

Gets the properties of a computer system memory device and
its associated mapped addresses.

.DESCRIPTION

Gets the properties of a computer system memory device and
its associated mapped addresses and converts all codes in
results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-MemoryDevice can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-MemoryDevice returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-MemoryDevice

.EXAMPLE

PS C:\> Get-MemoryDevice -ComputerName Server1

.EXAMPLE

PS C:\> Get-MemoryDevice -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-MemoryDevice -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-MemoryDevice -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-MemoryDevice -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-MemoryDevice -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-MemoryDevice

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-MemoryDevice

.EXAMPLE

PS C:\> "Server1" | Get-MemoryDevice

.EXAMPLE

PS C:\> "192.168.0.5" | Get-MemoryDevice

.EXAMPLE

PS C:\> Get-MemoryDevice -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-memorydevice
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_MemoryDevice'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $MemoryDevice = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $MemoryDevice){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.ErrorAccess = Get-ErrorAccess ($_.ErrorAccess)
        $_.ErrorDataOrder = Get-ErrorDataOrder ($_.ErrorDataOrder)
        $_.ErrorGranularity = Get-ErrorGranularity ($_.ErrorGranularity)
        $_.ErrorInfo = Get-ErrorInfo ($_.ErrorInfo)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $MemoryDevice
}