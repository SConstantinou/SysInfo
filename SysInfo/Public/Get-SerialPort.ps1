function Get-SerialPort {

    $Properties = ((Get-CimClass -ClassName Win32_SerialPort).CimClassProperties).Name

    $SerialPort = Get-CimInstance -ClassName Win32_SerialPort -Property $Properties | Select-Object $Properties

    foreach ($_ in $SerialPort){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $SerialPort
}