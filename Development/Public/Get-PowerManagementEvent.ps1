function Get-PowerManagementEvent {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PowerManagementEvent).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PowerManagementEvent = Get-CimInstance -ClassName Win32_PowerManagementEvent -Property $Properties | Select-Object $Properties
    }
    else{

        $PowerManagementEvent = Get-CimInstance -ClassName Win32_PowerManagementEvent -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PowerManagementEvent){

        $_.EventType = Get-EventType ($_.EventType)
    }
    
    Write-Output $PowerManagementEvent
}