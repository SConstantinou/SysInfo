function Get-IDEController {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_IDEController).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $IDEController = Get-CimInstance -ClassName Win32_IDEController -Property $Properties | Select-Object $Properties
    }
    else{

        $IDEController = Get-CimInstance -ClassName Win32_IDEController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $IDEController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $IDEController
}