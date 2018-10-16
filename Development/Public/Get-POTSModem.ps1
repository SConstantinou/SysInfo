function Get-POTSModem {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_POTSModem).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $POTSModem = Get-CimInstance -ClassName Win32_POTSModem -Property $Properties | Select-Object $Properties
    }
    else{

        $POTSModem = Get-CimInstance -ClassName Win32_POTSModem -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

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