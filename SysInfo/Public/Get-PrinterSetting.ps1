function Get-PrinterSetting {

    $Properties = ((Get-CimClass -ClassName Win32_PrinterSetting).CimClassProperties).Name

    $PrinterSetting = Get-CimInstance -ClassName Win32_PrinterSetting -Property $Properties | Select-Object $Properties
    
    Write-Output $PrinterSetting
}