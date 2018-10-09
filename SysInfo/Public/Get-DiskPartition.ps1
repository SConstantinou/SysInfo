function Get-DiskPartition {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_DiskPartition).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $DiskPartition = Get-CimInstance -ClassName Win32_DiskPartition -Property $Properties | Select-Object $Properties
    }
    else{

        $DiskPartition = Get-CimInstance -ClassName Win32_DiskPartition -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DiskPartition){

        [uint64]$Size = $_.Size
        [uint64]$StartingOffset = $_.StartingOffset


        switch ($Size){
            {$Size -gt 1KB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeKB" -Value "" -Force
                }
            {$Size -gt 1MB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeMB" -Value "" -Force
                }
            {$Size -gt 1GB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeGB" -Value "" -Force
                }
            {$Size -gt 1TB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeTB" -Value "" -Force
                }
            {$Size -gt 1PB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizePB" -Value "" -Force
                }
        }

        if ($_.BlockSize -gt 1KB) {

            $DiskPartition | Add-Member -MemberType NoteProperty -Name "BlockSizeKB" -Value "" -Force
        }

        switch ($StartingOffset){
            {$StartingOffset -gt 1KB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetKB" -Value "" -Force
                }
            {$StartingOffset -gt 1MB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetMB" -Value "" -Force
                }
            {$StartingOffset -gt 1GB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetGB" -Value "" -Force
                }
            {$StartingOffset -gt 1TB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetTB" -Value "" -Force
                }
            {$StartingOffset -gt 1PB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetPB" -Value "" -Force
                }
        }

    }
    
    foreach ($_ in $DiskPartition){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        if ($_.PSObject.Properties.Name -match "SizeKB"){$_.SizeKB = Get-SizeKB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeMB"){$_.SizeMB = Get-SizeMB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeGB"){$_.SizeGB = Get-SizeGB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeTB"){$_.SizeTB = Get-SizeTB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizePB"){$_.SizePB = Get-SizePB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "BlockSizeKB"){$_.BlockSizeKB = Get-SizeKB ($_.BlockSize)}
        if ($_.PSObject.Properties.Name -match "StartingOffsetKB"){$_.StartingOffsetKB = Get-SizeKB ($_.StartingOffset)}
        if ($_.PSObject.Properties.Name -match "StartingOffsetMB"){$_.StartingOffsetMB = Get-SizeMB ($_.StartingOffset)}
        if ($_.PSObject.Properties.Name -match "StartingOffsetGB"){$_.StartingOffsetGB = Get-SizeGB ($_.StartingOffset)}
        if ($_.PSObject.Properties.Name -match "StartingOffsetTB"){$_.StartingOffsetTB = Get-SizeTB ($_.StartingOffset)}
        if ($_.PSObject.Properties.Name -match "StartingOffsetPB"){$_.StartingOffsetPB = Get-SizePB ($_.StartingOffset)}
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)    
    }
    
    Write-Output $DiskPartition
}