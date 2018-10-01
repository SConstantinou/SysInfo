function Get-CacheMemory {

    $Properties = ((Get-CimClass -ClassName Win32_CacheMemory).CimClassProperties).Name

    $CacheMemory = Get-CimInstance -ClassName Win32_CacheMemory -Property $Properties | Select-Object $Properties

    foreach ($_ in $CacheMemory){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
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
    }
    
    Write-Output $CacheMemory
}