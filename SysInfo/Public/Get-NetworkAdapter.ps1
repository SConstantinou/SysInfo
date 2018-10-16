function Get-NetworkAdapter {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_NetworkAdapter).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $NetworkAdapter = Get-CimInstance -ClassName Win32_NetworkAdapter -Property $Properties | Select-Object $Properties
    }
    else{

        $NetworkAdapter = Get-CimInstance -ClassName Win32_NetworkAdapter -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $NetworkAdapter){

        [uint64]$Speed = $_.Speed

        switch ($Speed){
            {$Speed -ge 1000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedKbps" -Value "" -Force
                }
            {$Speed -ge 1000000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedMbps" -Value "" -Force
                }
            {$Speed -ge 1000000000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedGbps" -Value "" -Force
                }
        }
    }

    foreach ($_ in $NetworkAdapter){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.NetConnectionStatus = Get-NetConnectionStatus ($_.NetConnectionStatus)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "SpeedKbps"){$_.SpeedKbps = Get-SpeedKbpsConversion ($_.Speed)}
        if ($_.PSObject.Properties.Name -match "SpeedMbps"){$_.SpeedMbps = Get-SpeedMbpsConversion ($_.Speed)}
        if ($_.PSObject.Properties.Name -match "SpeedGbps"){$_.SpeedGbps = Get-SpeedGbpsConversion ($_.Speed)}
    }

    Write-Output $NetworkAdapter
}