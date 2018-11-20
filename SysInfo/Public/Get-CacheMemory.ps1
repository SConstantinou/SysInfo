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

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-CacheMemory can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-CacheMemory returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-CacheMemory

This command gets the information from local system

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName "192.168.0.5"

This command gets the information from remote system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1,Server2,Server3

This command gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1 -Properties Name,Status

This command gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1 -Properties *

This command gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-CacheMemory

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-CacheMemory -ComputerName Server1 -Protocol DCOM

This command gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-cachememory
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_CacheMemory'
    [System.Collections.ArrayList]$DefaultProperties = 'BlockSize','CacheSpeed','CacheType','DeviceID','InstalledSize','Level','MaxCacheSize','NumberOfBlocks','Status','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $CacheMemory = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

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

    Optimize-Output -Object $CacheMemory -Properties $Properties -DefaultProperties $DefaultProperties
}