function Get-CacheMemory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_CacheMemory).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $CacheMemory = Get-CimInstance -ClassName Win32_CacheMemory -Property $Properties | Select-Object $Properties
    }
    else{

        $CacheMemory = Get-CimInstance -ClassName Win32_CacheMemory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

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