function Get-ParallelPort {

    $Properties = ((Get-CimClass -ClassName Win32_ParallelPort).CimClassProperties).Name

    $ParallelPort = Get-CimInstance -ClassName Win32_ParallelPort -Property $Properties | Select-Object $Properties

    foreach ($_ in $ParallelPort){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $ParallelPort
}