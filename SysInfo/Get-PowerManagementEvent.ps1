function Get-PowerManagementEvent {

    $Properties = ((Get-CimClass -ClassName Win32_PowerManagementEvent).CimClassProperties).Name

    $PowerManagementEvent = Get-CimInstance -ClassName Win32_PowerManagementEvent -Property $Properties | Select-Object $Properties

    foreach ($_ in $PowerManagementEvent){

        $_.EventType = Get-EventType ($_.EventType)
    }
    
    Write-Output $PowerManagementEvent
}