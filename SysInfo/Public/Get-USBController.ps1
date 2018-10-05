function Get-USBController {

    $Properties = ((Get-CimClass -ClassName Win32_USBController).CimClassProperties).Name

    $USBController = Get-CimInstance -ClassName Win32_USBController -Property $Properties | Select-Object $Properties

    foreach ($_ in $USBController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $USBController
}