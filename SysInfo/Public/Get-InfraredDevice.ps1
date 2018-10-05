function Get-InfraredDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_InfraredDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $InfraredDevice = Get-CimInstance -ClassName Win32_InfraredDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $InfraredDevice = Get-CimInstance -ClassName Win32_InfraredDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $InfraredDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $InfraredDevice
}