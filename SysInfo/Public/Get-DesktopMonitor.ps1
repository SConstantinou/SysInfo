function Get-DesktopMonitor {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_DesktopMonitor).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $DesktopMonitor = Get-CimInstance -ClassName Win32_DesktopMonitor -Property $Properties | Select-Object $Properties
    }
    else{

        $DesktopMonitor = Get-CimInstance -ClassName Win32_DesktopMonitor -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DesktopMonitor){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.DisplayType = Get-DisplayType ($_.DisplayType)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $DesktopMonitor
}