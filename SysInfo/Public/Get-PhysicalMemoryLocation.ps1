function Get-PhysicalMemoryLocation {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PhysicalMemoryLocation).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PhysicalMemoryLocation = Get-CimInstance -ClassName Win32_PhysicalMemoryLocation -Property $Properties | Select-Object $Properties
    }
    else{

        $PhysicalMemoryLocation = Get-CimInstance -ClassName Win32_PhysicalMemoryLocation -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $PhysicalMemoryLocation
}