function Get-DeviceBus {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DeviceBus).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DeviceBus = Get-CimInstance -ClassName Win32_DeviceBus -Property $Properties | Select-Object $Properties
    }
    else{

        $DeviceBus = Get-CimInstance -ClassName Win32_DeviceBus -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DeviceBus
}