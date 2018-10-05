function Get-POTSModem {

    $Properties = ((Get-CimClass -ClassName Win32_POTSModem).CimClassProperties).Name

    $POTSModem = Get-CimInstance -ClassName Win32_POTSModem -Property $Properties | Select-Object $Properties

    foreach ($_ in $POTSModem){

        $_.AnswerMode = Get-AnswerMode ($_.AnswerMode)
        $_.Availability = Get-Availability ($_.Availability)
        $_.CompressionInfo = Get-CompressionInfo ($_.CompressionInfo)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.DialType = Get-DialType ($_.DialType)
        $_.ErrorControlInfo = Get-ErrorControlInfo ($_.ErrorControlInfo)
        $_.ModulationScheme = Get-ModulationScheme ($_.ModulationScheme)
        $_.PortSubClass = Get-PortSubClass ($_.PortSubClass)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.SpeakerVolumeInfo = Get-SpeakerVolumeInfo ($_.SpeakerVolumeInfo)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $POTSModem
}