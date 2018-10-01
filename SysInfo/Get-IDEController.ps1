function Get-IDEController {

    $Properties = ((Get-CimClass -ClassName Win32_IDEController).CimClassProperties).Name

    $IDEController = Get-CimInstance -ClassName Win32_IDEController -Property $Properties | Select-Object $Properties

    foreach ($_ in $IDEController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $IDEController
}