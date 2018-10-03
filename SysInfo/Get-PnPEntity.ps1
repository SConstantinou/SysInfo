function Get-PnPEntity {

    $Properties = ((Get-CimClass -ClassName Win32_PnPEntity).CimClassProperties).Name

    $PnPEntity = Get-CimInstance -ClassName Win32_PnPEntity -Property $Properties | Select-Object $Properties

    foreach ($_ in $PnPEntity){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $PnPEntity
}