function Get-MemoryArrayLocation {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_MemoryArrayLocation).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $MemoryArrayLocation = Get-CimInstance -ClassName Win32_MemoryArrayLocation -Property $Properties | Select-Object $Properties
    }
    else{

        $MemoryArrayLocation = Get-CimInstance -ClassName Win32_MemoryArrayLocation -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $MemoryArrayLocation
}