function Get-MemoryArray {

    $Properties = ((Get-CimClass -ClassName Win32_MemoryArray).CimClassProperties).Name

    $MemoryArray = Get-CimInstance -ClassName Win32_MemoryArray -Property $Properties | Select-Object $Properties

    foreach ($_ in $IRQResource){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ErrorAccess = Get-ErrorAccess ($_.ErrorAccess)
        $_.ErrorDataOrder = Get-ErrorDataOrder ($_.ErrorDataOrder)
        $_.ErrorGranularity = Get-ErrorGranularity ($_.ErrorGranularity)
        $_.ErrorInfo = Get-ErrorInfo ($_.ErrorInfo)
    }
    
    Write-Output $MemoryArray
}