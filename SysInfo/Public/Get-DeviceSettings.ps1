function Get-DeviceSettings {

    $Properties = ((Get-CimClass -ClassName Win32_DeviceSettings).CimClassProperties).Name

    $DeviceSettings = Get-CimInstance -ClassName Win32_DeviceSettings -Property $Properties | Select-Object $Properties
    
    Write-Output $DeviceSettings
}