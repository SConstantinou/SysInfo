function Get-DeviceBus {

    $Properties = ((Get-CimClass -ClassName Win32_DeviceBus).CimClassProperties).Name

    $DeviceBus = Get-CimInstance -ClassName Win32_DeviceBus -Property $Properties | Select-Object $Properties
    
    Write-Output $DeviceBus
}