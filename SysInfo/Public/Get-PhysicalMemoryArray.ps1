function Get-PhysicalMemoryArray {

    $Properties = ((Get-CimClass -ClassName Win32_PhysicalMemoryArray).CimClassProperties).Name

    $PhysicalMemoryArray = Get-CimInstance -ClassName Win32_PhysicalMemoryArray -Property $Properties | Select-Object $Properties

    foreach ($_ in $PhysicalMemoryArray){

        $_.Location = Get-PhysicalMemoryArrayLocation ($_.Location)
        $_.MemoryErrorCorrection = Get-MemoryErrorCorrection ($_.MemoryErrorCorrection)
        $_.Use = Get-PhysicalMemoryArrayUse ($_.Use)
    }
    
    Write-Output $PhysicalMemoryArray
}