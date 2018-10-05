function Get-FloppyDrive {

    $Properties = ((Get-CimClass -ClassName Win32_FloppyDrive).CimClassProperties).Name

    $FloppyDrive = Get-CimInstance -ClassName Win32_FloppyDrive -Property $Properties | Select-Object $Properties

    foreach ($_ in $FloppyDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $FloppyDrive
}