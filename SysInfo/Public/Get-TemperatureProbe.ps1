function Get-TemperatureProbe {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_TemperatureProbe).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $TemperatureProbe = Get-CimInstance -ClassName Win32_TemperatureProbe -Property $Properties | Select-Object $Properties
    }
    else{
    
        $TemperatureProbe = Get-CimInstance -ClassName Win32_TemperatureProbe -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $TemperatureProbe){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $TemperatureProbe
}

