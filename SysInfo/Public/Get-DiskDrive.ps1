function Get-DiskDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DiskDrive).CimClassProperties).Name
    
    if ($ComputerName -eq ''){

        $DiskDrive = Get-CimInstance -ClassName Win32_DiskDrive -Property $Properties | Select-Object $Properties
    }
    else{

        $DiskDrive = Get-CimInstance -ClassName Win32_DiskDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    $DiskDrive | ForEach-Object {$_.Size  = [math]::Round($_.Size / 1GB)} #change the name

    foreach ($_ in $DiskDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $DiskDrive
}