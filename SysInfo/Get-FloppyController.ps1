function Get-FloppyController {

    $Properties = ((Get-CimClass -ClassName Win32_FloppyController).CimClassProperties).Name

    $FloppyController = Get-CimInstance -ClassName Win32_FloppyController -Property $Properties | Select-Object $Properties

    foreach ($_ in $FloppyController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $FloppyController
}