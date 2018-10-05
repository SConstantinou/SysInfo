function Get-AllocatedResource {

    $Properties = ((Get-CimClass -ClassName Win32_AllocatedResource).CimClassProperties).Name

    $AllocatedResource = Get-CimInstance -ClassName Win32_AllocatedResource -Property $Properties | Select-Object $Properties
    
    Write-Output $AllocatedResource
}