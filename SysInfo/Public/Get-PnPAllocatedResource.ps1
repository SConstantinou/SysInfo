function Get-PnPAllocatedResource {

    $Properties = ((Get-CimClass -ClassName Win32_PnPAllocatedResource).CimClassProperties).Name

    $PnPAllocatedResource = Get-CimInstance -ClassName Win32_PnPAllocatedResource -Property $Properties | Select-Object $Properties
    
    Write-Output $PnPAllocatedResource
}