function Get-Bus {

    $Properties = ((Get-CimClass -ClassName Win32_Bus).CimClassProperties).Name

    $Bus = Get-CimInstance -ClassName Win32_Bus -Property $Properties | Select-Object $Properties

    foreach ($_ in $Bus){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.BusType = Get-BusType ($_.BusType)
    }
    
    Write-Output $Bus
}