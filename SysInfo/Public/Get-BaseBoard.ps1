function Get-BaseBoard {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_BaseBoard).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $BaseBoard = Get-CimInstance -ClassName Win32_BaseBoard -Property $Properties | Select-Object $Properties
    }
    else{
    
        $BaseBoard = Get-CimInstance -ClassName Win32_BaseBoard -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $BaseBoard
}