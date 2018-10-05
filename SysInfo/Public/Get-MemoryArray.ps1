﻿function Get-MemoryArray {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_MemoryArray).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $MemoryArray = Get-CimInstance -ClassName Win32_MemoryArray -Property $Properties | Select-Object $Properties
    }
    else{
    
        $MemoryArray = Get-CimInstance -ClassName Win32_MemoryArray -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

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