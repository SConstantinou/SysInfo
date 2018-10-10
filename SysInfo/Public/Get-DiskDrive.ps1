function Get-DiskDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_DiskDrive).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}
    
    if ($ComputerName -eq ''){

        $DiskDrive = Get-CimInstance -ClassName Win32_DiskDrive -Property $Properties | Select-Object $Properties
    }
    else{

        $DiskDrive = Get-CimInstance -ClassName Win32_DiskDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DiskDrive){

        [uint64]$MaxMediaSize = $_.MaxMediaSize
        [uint64]$Size = $_.Size

        if ($_.DefaultBlockSize -gt 1KB) {

            $DiskDrive | Add-Member -MemberType NoteProperty -Name "DefaultBlockSizeKB" -Value "" -Force
        }

        if ($_.MaxBlockSize -gt 1KB) {

            $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxBlockSizeKB" -Value "" -Force
        }

        switch ($MaxMediaSize){
            {$MaxMediaSize -gt 1MB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeMB" -Value "" -Force
                }
            {$MaxMediaSize -gt 1GB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeGB" -Value "" -Force
                }
            {$MaxMediaSize -gt 1TB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeTB" -Value "" -Force
                }
            {$MaxMediaSize -gt 1PB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizePB" -Value "" -Force
                }
        }

        if ($_.MinBlockSize -gt 1KB) {

            $DiskDrive | Add-Member -MemberType NoteProperty -Name "MinBlockSizeKB" -Value "" -Force
        }

        switch ($Size){
            {$Size -gt 1KB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeKB" -Value "" -Force
                }
            {$Size -gt 1MB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeMB" -Value "" -Force
                }
            {$Size -gt 1GB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeGB" -Value "" -Force
                }
            {$Size -gt 1TB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeTB" -Value "" -Force
                }
            {$Size -gt 1PB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizePB" -Value "" -Force
                }
        }
    }

    foreach ($_ in $DiskDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "DefaultBlockSizeKB"){$_.DefaultBlockSizeKB = Get-SizeKB ($_.DefaultBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxBlockSizeKB"){$_.MaxBlockSizeKB = Get-SizeKB ($_.MaxBlockSize)}
        if ($_.PSObject.Properties.Name -match "MinBlockSizeKB"){$_.MinBlockSizeKB = Get-SizeKB ($_.MinBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeMB"){$_.MaxMediaSizeMB = Get-SizeMB ($_.MaxMediaSize)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeGB"){$_.MaxMediaSizeGB = Get-SizeGB ($_.MaxMediaSize)}
        if ($_.PSObject.Properties.Name -match "SizeKB"){$_.SizeKB = Get-SizeKB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeMB"){$_.SizeMB = Get-SizeMB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeGB"){$_.SizeGB = Get-SizeGB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeTB"){$_.SizeTB = Get-SizeTB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizePB"){$_.SizePB = Get-SizePB ($_.Size)}
    }

    Write-Output $DiskDrive
}