function Get-VideoSettings {

    $Properties = ((Get-CimClass -ClassName Win32_VideoSettings).CimClassProperties).Name

    $VideoSettings = Get-CimInstance -ClassName Win32_VideoSettings -Property $Properties | Select-Object $Properties
    
    Write-Output $VideoSettings
}