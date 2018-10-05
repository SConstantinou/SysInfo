function Get-MotherboardDevice {

    $Properties = ((Get-CimClass -ClassName Win32_MotherboardDevice).CimClassProperties).Name

    $MotherboardDevice = Get-CimInstance -ClassName Win32_MotherboardDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $MotherboardDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $MotherboardDevice
}