function Get-SCSIController {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_SCSIController).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $SCSIController = Get-CimInstance -ClassName Win32_SCSIController -Property $Properties | Select-Object $Properties
    }
    else{

        $SCSIController = Get-CimInstance -ClassName Win32_SCSIController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SCSIController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtectionManagement = Get-ProtectionManagement ($_.ProtectionManagement)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $SCSIController
}