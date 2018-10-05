function Get-SoundDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SoundDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SoundDevice = Get-CimInstance -ClassName Win32_SoundDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $SoundDevice = Get-CimInstance -ClassName Win32_SoundDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SoundDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $SoundDevice
}