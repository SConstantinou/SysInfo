function Get-Battery {

    $Properties = ((Get-CimClass -ClassName Win32_Battery).CimClassProperties).Name

    $Battery = Get-CimInstance -ClassName Win32_Battery -Property $Properties | Select-Object $Properties

    foreach ($_ in $Battery){

        $_.Availability = Get-Availability ($_.Availability)
        $_.BatteryStatus = Get-BatteryStatus ($_.BatteryStatus)
        $_.Chemistry = Get-Chemistry ($_.Chemistry)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $Battery
}