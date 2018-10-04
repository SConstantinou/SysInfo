function Get-DriverForDevice {

    $Properties = ((Get-CimClass -ClassName Win32_DriverForDevice).CimClassProperties).Name

    $DriverForDevice = Get-CimInstance -ClassName Win32_DriverForDevice -Property $Properties | Select-Object $Properties
    
    Write-Output $DriverForDevice
}