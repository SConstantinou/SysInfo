function Get-PCMCIAController {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PCMCIAController).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PCMCIAController = Get-CimInstance -ClassName Win32_PCMCIAController -Property $Properties | Select-Object $Properties
    }
    else{

        $PCMCIAController = Get-CimInstance -ClassName Win32_PCMCIAController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PCMCIAController){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
    }
    
    Write-Output $PCMCIAController
}