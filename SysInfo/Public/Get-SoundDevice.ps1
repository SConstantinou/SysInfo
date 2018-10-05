function Get-SoundDevice {

    $Properties = ((Get-CimClass -ClassName Win32_SoundDevice).CimClassProperties).Name

    $SoundDevice = Get-CimInstance -ClassName Win32_SoundDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $SoundDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $SoundDevice
}