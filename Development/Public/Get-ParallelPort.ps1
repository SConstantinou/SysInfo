function Get-ParallelPort {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_ParallelPort).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $ParallelPort = Get-CimInstance -ClassName Win32_ParallelPort -Property $Properties | Select-Object $Properties
    }
    else{

        $ParallelPort = Get-CimInstance -ClassName Win32_ParallelPort -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $ParallelPort){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $ParallelPort
}