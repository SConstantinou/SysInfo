function Get-NetworkAdapter {

    $Properties = ((Get-CimClass -ClassName Win32_NetworkAdapter).CimClassProperties).Name

    $NetworkAdapter = Get-CimInstance -ClassName Win32_NetworkAdapter -Property $Properties | Select-Object $Properties

    foreach ($_ in $NetworkAdapter){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.NetConnectionStatus = Get-NetConnectionStatus ($_.NetConnectionStatus)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $NetworkAdapter
}