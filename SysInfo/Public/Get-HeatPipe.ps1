function Get-HeatPipe {
    
    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_HeatPipe).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $HeatPipe = Get-CimInstance -ClassName Win32_HeatPipe -Property $Properties | Select-Object -Property $Properties
    }
    else{

        $HeatPipe = Get-CimInstance -ClassName Win32_HeatPipe -Property $Properties -ComputerName $ComputerName | Select-Object -Property $Properties
    }

    foreach ($_ in $HeatPipe){
    
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $HeatPipe
}