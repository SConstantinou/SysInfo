function Get-PnPDevice {

    $Properties = ((Get-CimClass -ClassName Win32_PnPDevice).CimClassProperties).Name

    $PnPDevice = Get-CimInstance -ClassName Win32_PnPDevice -Property $Properties | Select-Object $Properties
    
    Write-Output $PnPDevice
}