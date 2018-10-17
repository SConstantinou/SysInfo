function Get-VoltageProbe {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_VoltageProbe).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $VoltageProbe = Get-CimInstance -ClassName Win32_VoltageProbe -Property $Properties | Select-Object $Properties
    }
    else{

        $VoltageProbe = Get-CimInstance -ClassName Win32_VoltageProbe -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $VoltageProbe){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $VoltageProbe
}