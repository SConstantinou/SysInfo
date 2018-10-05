function Get-AssociatedProcessorMemory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_AssociatedProcessorMemory).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $AssociatedProcessorMemory = Get-CimInstance -ClassName Win32_AssociatedProcessorMemory -Property $Properties | Select-Object $Properties
    }
    else{

        $AssociatedProcessorMemory = Get-CimInstance -ClassName Win32_AssociatedProcessorMemory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $AssociatedProcessorMemory
}