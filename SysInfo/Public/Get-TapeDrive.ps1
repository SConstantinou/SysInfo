function Get-TapeDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_TapeDrive).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $TapeDrive = Get-CimInstance -ClassName Win32_TapeDrive -Property $Properties | Select-Object $Properties
    }
    else{
        
        $TapeDrive = Get-CimInstance -ClassName Win32_TapeDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

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