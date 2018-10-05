function Get-SMBIOSMemory {

    $Properties = ((Get-CimClass -ClassName Win32_SMBIOSMemory).CimClassProperties).Name

    $SMBIOSMemory = Get-CimInstance -ClassName Win32_SMBIOSMemory -Property $Properties | Select-Object $Properties

    foreach ($_ in $SMBIOSMemory){

        $_.Access = Get-Access ($_.Access)
        #$_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.ErrorAccess = Get-ErrorAccess ($_.ErrorAccess)
        $_.ErrorDataOrder = Get-ErrorDataOrder ($_.ErrorDataOrder)
        $_.ErrorInfo = Get-ErrorInfo ($_.ErrorInfo)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $SMBIOSMemory
}