function Get-DiskDrive {

    $Properties = ((Get-CimClass -ClassName Win32_DiskDrive).CimClassProperties).Name
    
    $DiskDrive = Get-CimInstance -ClassName Win32_DiskDrive -Property $Properties | Select-Object $Properties

    $DiskDrive | ForEach-Object {$_.Size  = [math]::Round($_.Size / 1GB)} #change the name

    foreach ($_ in $DiskDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $DiskDrive
}