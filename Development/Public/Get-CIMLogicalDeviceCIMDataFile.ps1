function Get-CIMLogicalDeviceCIMDataFile {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_CIMLogicalDeviceCIMDataFile).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $CIMLogicalDeviceCIMDataFile = Get-CimInstance -ClassName Win32_CIMLogicalDeviceCIMDataFile -Property $Properties | Select-Object $Properties
    }
    else{

        $CIMLogicalDeviceCIMDataFile = Get-CimInstance -ClassName Win32_CIMLogicalDeviceCIMDataFile -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $CIMLogicalDeviceCIMDataFile){

        $_.Purpose = Get-Purpose ($_.Purpose)
    }
    
    Write-Output $CIMLogicalDeviceCIMDataFile
}