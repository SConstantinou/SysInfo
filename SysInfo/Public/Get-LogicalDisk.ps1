function Get-LogicalDisk {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_LogicalDisk).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $LogicalDisk = Get-CimInstance -ClassName Win32_LogicalDisk -Property $Properties | Select-Object $Properties
    }
    else{

        $LogicalDisk = Get-CimInstance -ClassName Win32_LogicalDisk -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $LogicalDisk){

        [uint64]$Size = $_.Size
        [uint64]$FreeSpace = $_.FreeSpace

        switch ($Size){
            {$Size -ge 1KB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "SizeKB" -Value "" -Force
                }
            {$Size -ge 1MB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "SizeMB" -Value "" -Force
                }
            {$Size -ge 1GB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "SizeGB" -Value "" -Force
                }
            {$Size -ge 1TB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "SizeTB" -Value "" -Force
                }
            {$Size -ge 1PB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "SizePB" -Value "" -Force
                }
        }

        switch ($FreeSpace){
            {$FreeSpace -ge 1KB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "FreeSpaceKB" -Value "" -Force
                }
            {$FreeSpace -ge 1MB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "FreeSpaceMB" -Value "" -Force
                }
            {$FreeSpace -ge 1GB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "FreeSpaceGB" -Value "" -Force
                }
            {$FreeSpace -ge 1TB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "FreeSpaceTB" -Value "" -Force
                }
            {$FreeSpace -ge 1PB}
                {
                    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "FreeSpacePB" -Value "" -Force
                }
        }

    }

    foreach ($_ in $LogicalDisk){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.DriveType = Get-DriveType ($_.DriveType)
        $_.MediaType = Get-LogicalDiskMediaType ($_.MediaType)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "SizeKB"){$_.SizeKB = Get-SizeKB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeMB"){$_.SizeMB = Get-SizeMB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeGB"){$_.SizeGB = Get-SizeGB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeTB"){$_.SizeTB = Get-SizeTB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizePB"){$_.SizePB = Get-SizePB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "FreeSpaceKB"){$_.FreeSpaceKB = Get-SizeKB ($_.FreeSpace)}
        if ($_.PSObject.Properties.Name -match "FreeSpaceMB"){$_.FreeSpaceMB = Get-SizeMB ($_.FreeSpace)}
        if ($_.PSObject.Properties.Name -match "FreeSpaceGB"){$_.FreeSpaceGB = Get-SizeGB ($_.FreeSpace)}
        if ($_.PSObject.Properties.Name -match "FreeSpaceTB"){$_.FreeSpaceTB = Get-SizeTB ($_.FreeSpace)}
        if ($_.PSObject.Properties.Name -match "FreeSpacePB"){$_.FreeSpacePB = Get-SizePB ($_.FreeSpace)}
    }

    Write-Output $LogicalDisk
}