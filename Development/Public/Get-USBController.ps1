function Get-USBController {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_USBController).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $USBController = Get-CimInstance -ClassName Win32_USBController -Property $Properties | Select-Object $Properties
    }
    else{
    
        $USBController = Get-CimInstance -ClassName Win32_USBController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $USBController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $USBController
}