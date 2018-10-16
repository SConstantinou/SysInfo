function Get-LogicalDiskRootDirectory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_LogicalDiskRootDirectory).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $LogicalDiskRootDirectory = Get-CimInstance -ClassName Win32_LogicalDiskRootDirectory -Property $Properties | Select-Object $Properties
    }
    else{

        $LogicalDiskRootDirectory = Get-CimInstance -ClassName Win32_LogicalDiskRootDirectory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $COMClass
}