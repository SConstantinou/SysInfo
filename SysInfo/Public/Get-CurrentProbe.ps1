function Get-CurrentProbe {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_CurrentProbe).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $CurrentProbe = Get-CimInstance -ClassName Win32_CurrentProbe -Property $Properties | Select-Object $Properties
    }
    else{

        $CurrentProbe = Get-CimInstance -ClassName Win32_CurrentProbe -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $CurrentProbe){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $CurrentProbe
}