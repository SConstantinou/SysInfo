﻿Function Get-Keyboard {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Keyboard).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Keyboard = Get-CimInstance -ClassName Win32_Keyboard -Property $Properties | Select-Object $Properties
    }
    else {

        $Keyboard = Get-CimInstance -ClassName Win32_Keyboard -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Keyboard){

        $_.Layout = Get-Layout ($_.Layout)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Keyboard
}