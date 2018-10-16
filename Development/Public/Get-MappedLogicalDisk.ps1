function Get-MappedLogicalDisk {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_MappedLogicalDisk).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $MappedLogicalDisk = Get-CimInstance -ClassName Win32_MappedLogicalDisk -Property $Properties | Select-Object $Properties
    }
    else{

        $MappedLogicalDisk = Get-CimInstance -ClassName Win32_MappedLogicalDisk -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $MappedLogicalDisk){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $MappedLogicalDisk
}