function Get-DisplayControllerConfiguration {

    $Properties = ((Get-CimClass -ClassName Win32_DisplayControllerConfiguration).CimClassProperties).Name

    $DisplayControllerConfiguration = Get-CimInstance -ClassName Win32_DisplayControllerConfiguration -Property $Properties | Select-Object $Properties
    
    Write-Output $DisplayControllerConfiguration
}