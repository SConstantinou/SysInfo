function Get-PhysicalMemoryArray {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PhysicalMemoryArray).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PhysicalMemoryArray = Get-CimInstance -ClassName Win32_PhysicalMemoryArray -Property $Properties | Select-Object $Properties
    }
    else{

        $PhysicalMemoryArray = Get-CimInstance -ClassName Win32_PhysicalMemoryArray -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PhysicalMemoryArray){

        $_.Location = Get-PhysicalMemoryArrayLocation ($_.Location)
        $_.MemoryErrorCorrection = Get-MemoryErrorCorrection ($_.MemoryErrorCorrection)
        $_.Use = Get-PhysicalMemoryArrayUse ($_.Use)
    }
    
    Write-Output $PhysicalMemoryArray
}