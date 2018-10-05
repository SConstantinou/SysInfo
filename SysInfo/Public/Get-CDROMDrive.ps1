function Get-CDROMDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_CDROMDrive).CimClassProperties).Name

    if ($ComputerName -eq ''){
    
        $CDROMDrive = Get-CimInstance -ClassName Win32_CDROMDrive -Property $Properties | Select-Object $Properties
    }
    else{

        $CDROMDrive = Get-CimInstance -ClassName Win32_CDROMDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $CDROMDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.FileSystemFlagsEx = Get-FileSystemFlagsEx ($_.FileSystemFlagsEx)
    }
    
    Write-Output $CDROMDrive
}