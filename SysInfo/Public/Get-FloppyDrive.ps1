function Get-FloppyDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_FloppyDrive).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $FloppyDrive = Get-CimInstance -ClassName Win32_FloppyDrive -Property $Properties | Select-Object $Properties
    }
    else{

        $FloppyDrive = Get-CimInstance -ClassName Win32_FloppyDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $FloppyDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $FloppyDrive
}