function Get-VideoController {

    $Properties = ((Get-CimClass -ClassName Win32_VideoController).CimClassProperties).Name

    $VideoController = Get-CimInstance -ClassName Win32_VideoController -Property $Properties | Select-Object $Properties

    foreach ($_ in $VideoController){

        $_.AcceleratorCapabilities = Get-AcceleratorCapabilities ($_.AcceleratorCapabilities)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CurrentScanMode = Get-CurrentScanMode ($_.CurrentScanMode)
        $_.DitherType = Get-DitherType ($_.DitherType)
        $_.ICMIntent = Get-ICMIntent ($_.ICMIntent)
        $_.ICMMethod = Get-ICMMethod ($_.ICMMethod)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.VideoArchitecture = Get-VideoArchitecture ($_.VideoArchitecture)
        $_.VideoMemoryType = Get-VideoMemoryType ($_.VideoMemoryType)
    }
    
    Write-Output $VideoController
}