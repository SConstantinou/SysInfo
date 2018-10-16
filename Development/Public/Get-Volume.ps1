function Get-Volume {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Volume).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Volume = Get-CimInstance -ClassName Win32_Volume -Property $Properties | Select-Object $Properties
    }
    else{

        $Volume = Get-CimInstance -ClassName Win32_Volume -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Volume){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.DriveType = Get-DriveType ($_.DriveType)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $Volume
}