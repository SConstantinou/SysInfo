function Get-MemoryArrayLocation {

    $Properties = ((Get-CimClass -ClassName Win32_MemoryArrayLocation).CimClassProperties).Name

    $MemoryArrayLocation = Get-CimInstance -ClassName Win32_MemoryArrayLocation -Property $Properties | Select-Object $Properties
    
    Write-Output $MemoryArrayLocation
}