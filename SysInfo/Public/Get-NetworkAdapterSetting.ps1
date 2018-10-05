function Get-NetworkAdapterSetting {

    $Properties = ((Get-CimClass -ClassName Win32_NetworkAdapterSetting).CimClassProperties).Name

    $NetworkAdapterSetting = Get-CimInstance -ClassName Win32_NetworkAdapterSetting -Property $Properties | Select-Object $Properties
    
    Write-Output $NetworkAdapterSetting
}