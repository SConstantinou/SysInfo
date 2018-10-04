function Get-VoltageProbe {

    $Properties = ((Get-CimClass -ClassName Win32_VoltageProbe).CimClassProperties).Name

    $VoltageProbe = Get-CimInstance -ClassName Win32_VoltageProbe -Property $Properties | Select-Object $Properties

    foreach ($_ in $VoltageProbe){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $VoltageProbe
}