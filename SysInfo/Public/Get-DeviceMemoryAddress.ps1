function Get-DeviceMemoryAddress {

    $Properties = ((Get-CimClass -ClassName Win32_DeviceMemoryAddress).CimClassProperties).Name

    $DeviceMemoryAddress = Get-CimInstance -ClassName Win32_DeviceMemoryAddress -Property $Properties | Select-Object $Properties
    
    Write-Output $DeviceMemoryAddress
}