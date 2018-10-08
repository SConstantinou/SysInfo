function Get-DiskDriveToDiskPartition {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DiskDriveToDiskPartition).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DiskDriveToDiskPartition = Get-CimInstance -ClassName Win32_DiskDriveToDiskPartition -Property $Properties | Select-Object $Properties
    }
    else{

        $DiskDriveToDiskPartition = Get-CimInstance -ClassName Win32_DiskDriveToDiskPartition -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DiskDriveToDiskPartition
}