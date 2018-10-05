function Get-SystemBIOS {

    $Properties = ((Get-CimClass -ClassName Win32_SystemBIOS).CimClassProperties).Name

    $SystemBIOS = Get-CimInstance -ClassName Win32_SystemBIOS -Property $Properties | Select-Object $Properties
    
    Write-Output $SystemBIOS
}