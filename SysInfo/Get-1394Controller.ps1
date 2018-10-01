function Get-1394Controller {

    $Properties = ((Get-CimClass -ClassName Win32_1394Controller).CimClassProperties).Name

    $1394Controller = Get-CimInstance -ClassName Win32_1394Controller -Property $Properties | Select-Object $Properties

    foreach ($_ in $1394Controller){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $1394Controller
}