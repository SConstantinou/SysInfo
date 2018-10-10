Function Get-MemoryDevice {

    [cmdletbinding()]

    param (
    [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_MemoryDevice).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $MemoryDevice = Get-CimInstance -ClassName Win32_MemoryDevice -Property $Properties | Select-Object $Properties
    }
    else {

        $MemoryDevice = Get-CimInstance -ClassName Win32_MemoryDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $MemoryDevice){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.ErrorAccess = Get-ErrorAccess ($_.ErrorAccess)
        $_.ErrorDataOrder = Get-ErrorDataOrder ($_.ErrorDataOrder)
        $_.ErrorGranularity = Get-ErrorGranularity ($_.ErrorGranularity)
        $_.ErrorInfo = Get-ErrorInfo ($_.ErrorInfo)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $MemoryDevice
}