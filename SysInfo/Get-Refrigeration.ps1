function Get-Refrigeration {

    $Properties = ((Get-CimClass -ClassName Win32_Refrigeration).CimClassProperties).Name

    $Refrigeration = Get-CimInstance -ClassName Win32_Refrigeration -Property $Properties | Select-Object -Property $Properties

    foreach ($_ in $Refrigeration){
    
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Refrigeration
}