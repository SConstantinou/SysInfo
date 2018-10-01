function Get-PointingDevice {

    $Properties = ((Get-CimClass -ClassName Win32_PointingDevice).CimClassProperties).Name

    $PointingDevice = Get-CimInstance -ClassName Win32_PointingDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $PointingDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.DeviceInterface = Get-DeviceInterface ($_.DeviceInterface)
        $_.PointingType = Get-PointingType ($_.PointingType)
    }

    Write-Output $PointingDevice
}