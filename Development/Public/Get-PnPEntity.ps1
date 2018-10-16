function Get-PnPEntity {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PnPEntity).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PnPEntity = Get-CimInstance -ClassName Win32_PnPEntity -Property $Properties | Select-Object $Properties
    }
    else{

        $PnPEntity = Get-CimInstance -ClassName Win32_PnPEntity -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PnPEntity){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $PnPEntity
}