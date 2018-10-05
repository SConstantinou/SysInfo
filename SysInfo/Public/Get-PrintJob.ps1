function Get-PrintJob {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PrintJob).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PrintJob = Get-CimInstance -ClassName Win32_PrintJob -Property $Properties | Select-Object $Properties
    }
    else{

        $PrintJob = Get-CimInstance -ClassName Win32_PrintJob -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PrintJob){

        $_.StatusMask = Get-StatusMask ($_.StatusMask)
    }
    
    Write-Output $PrintJob
}