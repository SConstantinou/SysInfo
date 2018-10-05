function Get-USBHub {

    $Properties = ((Get-CimClass -ClassName Win32_USBHub).CimClassProperties).Name

    $USBHub = Get-CimInstance -ClassName Win32_USBHub -Property $Properties | Select-Object $Properties

    foreach ($_ in $USBHub){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $USBHub
}