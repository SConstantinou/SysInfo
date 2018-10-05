function Get-Battery {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Battery).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Battery = Get-CimInstance -ClassName Win32_Battery -Property $Properties | Select-Object $Properties
    }
    else{

        $Battery = Get-CimInstance -ClassName Win32_Battery -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Battery){

        $_.Availability = Get-Availability ($_.Availability)
        $_.BatteryStatus = Get-BatteryStatus ($_.BatteryStatus)
        $_.Chemistry = Get-Chemistry ($_.Chemistry)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $Battery
}