function Get-PortableBattery {

    $Properties = ((Get-CimClass -ClassName Win32_PortableBattery).CimClassProperties).Name

    $PortableBattery = Get-CimInstance -ClassName Win32_PortableBattery -Property $Properties | Select-Object $Properties

    foreach ($_ in $PortableBattery){

        $_.Availability = Get-Availability ($_.Availability)
        $_.BatteryStatus = Get-BatteryStatus ($_.BatteryStatus)
        $_.Chemistry = Get-Chemistry ($_.Chemistry)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $PortableBattery
}