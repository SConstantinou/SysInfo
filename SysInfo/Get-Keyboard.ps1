function Get-Keyboard {

    $Properties = ((Get-CimClass -ClassName Win32_Keyboard).CimClassProperties).Name

    $Keyboard = Get-CimInstance -ClassName Win32_Keyboard -Property $Properties | Select-Object $Properties

    foreach ($_ in $Keyboard){
    
        $_.Layout = Get-Layout ($_.Layout)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $Keyboard
}