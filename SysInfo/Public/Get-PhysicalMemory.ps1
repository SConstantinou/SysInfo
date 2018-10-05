function Get-PhysicalMemory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PhysicalMemory).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PhysicalMemory = Get-CimInstance -ClassName Win32_PhysicalMemory -Property $Properties | Select-Object $Properties
    }
    else{

        $PhysicalMemory = Get-CimInstance -ClassName Win32_PhysicalMemory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PhysicalMemory){

        $_.FormFactor = Get-FormFactor ($_.FormFactor)
        $_.InterleavePosition = Get-InterleavePosition ($_.InterleavePosition)
        $_.MemoryType = Get-MemoryType ($_.MemoryType)
        $_.TypeDetail = Get-TypeDetail ($_.TypeDetail)
    }
    
    Write-Output $PhysicalMemory
}