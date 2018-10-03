function Get-SystemMemoryResource {

    $Properties = ((Get-CimClass -ClassName Win32_SystemMemoryResource).CimClassProperties).Name

    $SystemMemoryResource = Get-CimInstance -ClassName Win32_SystemMemoryResource -Property $Properties | Select-Object $Properties
    
    Write-Output $SystemMemoryResource
}