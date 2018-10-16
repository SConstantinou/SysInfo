function Get-SubDirectory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SubDirectory).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SubDirectory = Get-CimInstance -ClassName Win32_SubDirectory -Property $Properties | Select-Object $Properties
    }
    else{

        $SubDirectory = Get-CimInstance -ClassName Win32_SubDirectory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $SubDirectory
}