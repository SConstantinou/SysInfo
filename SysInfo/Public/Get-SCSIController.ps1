function Get-SCSIController {

    $Properties = ((Get-CimClass -ClassName Win32_SCSIController).CimClassProperties).Name

    $SCSIController = Get-CimInstance -ClassName Win32_SCSIController -Property $Properties | Select-Object $Properties

    foreach ($_ in $SCSIController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtectionManagement = Get-ProtectionManagement ($_.ProtectionManagement)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $SCSIController
}