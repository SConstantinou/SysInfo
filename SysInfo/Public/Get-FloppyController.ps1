function Get-FloppyController {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_FloppyController).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $FloppyController = Get-CimInstance -ClassName Win32_FloppyController -Property $Properties | Select-Object $Properties
    }
    else{

        $FloppyController = Get-CimInstance -ClassName Win32_FloppyController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $FloppyController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $FloppyController
}