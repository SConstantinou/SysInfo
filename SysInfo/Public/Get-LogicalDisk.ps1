function Get-LogicalDisk {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_LogicalDisk).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $LogicalDisk = Get-CimInstance -ClassName Win32_LogicalDisk -Property $Properties | Select-Object $Properties
    }
    else{

        $LogicalDisk = Get-CimInstance -ClassName Win32_LogicalDisk -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $LogicalDisk){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.DriveType = Get-DriveType ($_.DriveType)
        $_.MediaType = Get-LogicalDiskMediaType ($_.MediaType)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }
    
    Write-Output $LogicalDisk
}