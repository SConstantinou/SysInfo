function Get-MotherboardDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_MotherboardDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){
    
        $MotherboardDevice = Get-CimInstance -ClassName Win32_MotherboardDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $MotherboardDevice = Get-CimInstance -ClassName Win32_MotherboardDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $MotherboardDevice){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $MotherboardDevice
}