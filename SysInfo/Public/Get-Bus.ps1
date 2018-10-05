function Get-Bus {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Bus).CimClassProperties).Name

    if ($ComputerName -eq ''){
    
        $Bus = Get-CimInstance -ClassName Win32_Bus -Property $Properties | Select-Object $Properties
    }
    else{

        $Bus = Get-CimInstance -ClassName Win32_Bus -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Bus){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.BusType = Get-BusType ($_.BusType)
    }
    
    Write-Output $Bus
}