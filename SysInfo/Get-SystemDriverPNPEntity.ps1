function Get-SystemDriverPNPEntity {

    $Properties = ((Get-CimClass -ClassName Win32_SystemDriverPNPEntity).CimClassProperties).Name

    $SystemDriverPNPEntity = Get-CimInstance -ClassName Win32_SystemDriverPNPEntity -Property $Properties | Select-Object $Properties
    
    Write-Output $SystemDriverPNPEntity
}