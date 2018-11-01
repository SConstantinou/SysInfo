function Get-CacheMemory {
<#
.SYNOPSIS

Gets the internal and external cache memory on a computer system.

.DESCRIPTION

Gets the internal and external cache memory on a computer system
and converts all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-CacheMemory can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-CacheMemory returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-CacheMemory

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-CacheMemory -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-CacheMemory -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-CacheMemory

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-CacheMemory

.EXAMPLE

PS C:\> "Server1" | Get-CacheMemory

.EXAMPLE

PS C:\> "192.168.0.5" | Get-CacheMemory

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-cachememory
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_CacheMemory'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $CacheMemory = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $CacheMemory){

        $InstalledSize = $_.InstalledSize * 1KB
        $MaxCacheSize = $_.MaxCacheSize * 1KB

        if ($_.BlockSize -ge 1KB) {

            $CacheMemory | Add-Member -MemberType NoteProperty -Name "BlockSizeKB" -Value "" -Force
        }

        if ($InstalledSize -ge 1MB) {

            $CacheMemory | Add-Member -MemberType NoteProperty -Name "InstalledSizeMB" -Value "" -Force
        }

        if ($MaxCacheSize -ge 1MB) {

            $CacheMemory | Add-Member -MemberType NoteProperty -Name "MaxCacheSizeMB" -Value "" -Force
        }

    }

    foreach ($_ in $CacheMemory){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.Access = Get-Access ($_.Access)
        $_.Associativity = Get-Associativity ($_.Associativity)
        $_.CacheType = Get-CacheType ($_.CacheType)
        $_.CurrentSRAM = Get-CurrentSRAM ($_.CurrentSRAM)
        $_.ErrorAccess = Get-ErrorAccess ($_.ErrorAccess)
        $_.ErrorCorrectType = Get-ErrorCorrectType ($_.ErrorCorrectType)
        $_.ErrorDataOrder = Get-ErrorDataOrder ($_.ErrorDataOrder)
        $_.ErrorInfo = Get-ErrorInfo ($_.ErrorInfo)
        $_.Level = Get-Level ($_.Level)
        $_.Location = Get-Location ($_.Location)
        $_.ReadPolicy = Get-ReadPolicy ($_.ReadPolicy)
        $_.ReplacementPolicy = Get-ReplacementPolicy ($_.ReplacementPolicy)
        $_.SupportedSRAM = Get-SupportedSRAM ($_.SupportedSRAM)
        $_.WritePolicy = Get-WritePolicy ($_.WritePolicy)
        if ($_.PSObject.Properties.Name -match "BlockSizeKB"){$_.BlockSizeKB = Get-SizeKB ($_.BlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxCacheSizeMB"){$_.MaxCacheSizeMB = Get-SizeMB ($_.MaxCacheSize * 1KB)}
        if ($_.PSObject.Properties.Name -match "InstalledSizeMB"){$_.InstalledSizeMB = Get-SizeMB ($_.InstalledSize * 1KB)}
    }

    Write-Output $CacheMemory
}