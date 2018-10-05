function Get-PhysicalMemoryLocation {

    $Properties = ((Get-CimClass -ClassName Win32_PhysicalMemoryLocation).CimClassProperties).Name

    $PhysicalMemoryLocation = Get-CimInstance -ClassName Win32_PhysicalMemoryLocation -Property $Properties | Select-Object $Properties
    
    Write-Output $PhysicalMemoryLocation
}