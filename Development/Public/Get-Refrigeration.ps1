function Get-Refrigeration {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)
    
    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_Refrigeration).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $Refrigeration = Get-CimInstance -ClassName Win32_Refrigeration -Property $Properties | Select-Object -Property $Properties
    }
    else{

        $Refrigeration = Get-CimInstance -ClassName Win32_Refrigeration -Property $Properties -ComputerName $ComputerName | Select-Object -Property $Properties
    }

    foreach ($_ in $Refrigeration){
    
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Refrigeration
}