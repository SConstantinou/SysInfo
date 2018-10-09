function Get-SystemPartitions {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SystemPartitions).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SystemPartitions = Get-CimInstance -ClassName Win32_SystemPartitions -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemPartitions = Get-CimInstance -ClassName Win32_SystemPartitions -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $SystemPartitions
}