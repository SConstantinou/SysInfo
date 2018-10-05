function Get-AssociatedProcessorMemory {

    $Properties = ((Get-CimClass -ClassName Win32_AssociatedProcessorMemory).CimClassProperties).Name

    $AssociatedProcessorMemory = Get-CimInstance -ClassName Win32_AssociatedProcessorMemory -Property $Properties | Select-Object $Properties
    
    Write-Output $AssociatedProcessorMemory
}