function Get-TapeDrive {

    $Properties = ((Get-CimClass -ClassName Win32_TapeDrive).CimClassProperties).Name

    $TapeDrive = Get-CimInstance -ClassName Win32_TapeDrive -Property $Properties | Select-Object $Properties

    foreach ($_ in $TapeDrive){
    
        $_.Layout = Get-Layout ($_.Layout)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.Compression = Get-Compression ($_.Compression)
        $_.ECC = Get-ECC ($_.ECC)
        $_.ReportSetMarks = Get-ReportSetMarks ($_.ReportSetMarks)
    }
    
    Write-Output $TapeDrive
}