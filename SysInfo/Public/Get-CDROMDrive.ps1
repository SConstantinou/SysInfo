function Get-CDROMDrive {

    $Properties = ((Get-CimClass -ClassName Win32_CDROMDrive).CimClassProperties).Name

    $CDROMDrive = Get-CimInstance -ClassName Win32_CDROMDrive -Property $Properties | Select-Object $Properties

    foreach ($_ in $CDROMDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.FileSystemFlagsEx = Get-FileSystemFlagsEx ($_.FileSystemFlagsEx)
    }
    
    Write-Output $CDROMDrive
}