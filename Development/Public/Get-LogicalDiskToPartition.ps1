function Get-LogicalDiskToPartition {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_LogicalDiskToPartition).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $LogicalDiskToPartition = Get-CimInstance -ClassName Win32_LogicalDiskToPartition -Property $Properties | Select-Object $Properties
    }
    else{

        $LogicalDiskToPartition = Get-CimInstance -ClassName Win32_LogicalDiskToPartition -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $LogicalDiskToPartition
}