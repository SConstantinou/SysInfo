function Get-PortResource {

    $Properties = ((Get-CimClass -ClassName Win32_PortResource).CimClassProperties).Name

    $PortResource = Get-CimInstance -ClassName Win32_PortResource -Property $Properties | Select-Object $Properties
    
    Write-Output $PortResource
}