function Get-SerialPort {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SerialPort).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SerialPort = Get-CimInstance -ClassName Win32_SerialPort -Property $Properties | Select-Object $Properties
    }
    else{

        $SerialPort = Get-CimInstance -ClassName Win32_SerialPort -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SerialPort){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $SerialPort
}