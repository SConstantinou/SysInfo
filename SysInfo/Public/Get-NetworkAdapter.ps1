function Get-NetworkAdapter {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_NetworkAdapter).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $NetworkAdapter = Get-CimInstance -ClassName Win32_NetworkAdapter -Property $Properties | Select-Object $Properties
    }
    else{

        $NetworkAdapter = Get-CimInstance -ClassName Win32_NetworkAdapter -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $NetworkAdapter){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.NetConnectionStatus = Get-NetConnectionStatus ($_.NetConnectionStatus)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $NetworkAdapter
}