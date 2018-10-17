function Get-TapeDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_TapeDrive).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $TapeDrive = Get-CimInstance -ClassName Win32_TapeDrive -Property $Properties | Select-Object $Properties
    }
    else{

        $TapeDrive = Get-CimInstance -ClassName Win32_TapeDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $TapeDrive){

        [uint64]$MaxMediaSize = $_.MaxMediaSize * 1KB

        if ($_.DefaultBlockSize -ge 1KB) {

            $TapeDrive | Add-Member -MemberType NoteProperty -Name "DefaultBlockSizeKB" -Value "" -Force
        }

        if ($_.MaxBlockSize -ge 1KB) {

            $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxBlockSizeKB" -Value "" -Force
        }

        switch ($MaxMediaSize){
            {$MaxMediaSize -ge 1MB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeMB" -Value "" -Force
                }
            {$MaxMediaSize -ge 1GB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeGB" -Value "" -Force
                }
            {$MaxMediaSize -ge 1TB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeTB" -Value "" -Force
                }
            {$MaxMediaSize -ge 1PB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizePB" -Value "" -Force
                }
        }

        if ($_.MinBlockSize -ge 1KB) {

            $DiskDrive | Add-Member -MemberType NoteProperty -Name "MinBlockSizeKB" -Value "" -Force
        }
    }

    foreach ($_ in $TapeDrive){

        $_.Layout = Get-Layout ($_.Layout)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.Compression = Get-Compression ($_.Compression)
        $_.ECC = Get-ECC ($_.ECC)
        $_.ReportSetMarks = Get-ReportSetMarksStatus ($_.ReportSetMarks)
        if ($_.PSObject.Properties.Name -match "DefaultBlockSizeKB"){$_.DefaultBlockSizeKB = Get-SizeKB ($_.DefaultBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxBlockSizeKB"){$_.MaxBlockSizeKB = Get-SizeKB ($_.MaxBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeMB"){$_.MaxMediaSizeMB = Get-SizeMB ($_.MaxMediaSize)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeGB"){$_.MaxMediaSizeGB = Get-SizeGB ($_.MaxMediaSize * 1KB)}
	    if ($_.PSObject.Properties.Name -match "MaxMediaSizeTB"){$_.MaxMediaSizeTB = Get-SizeTB ($_.MaxMediaSize * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizePB"){$_.MaxMediaSizePB = Get-SizePB ($_.MaxMediaSize * 1KB)}
        if ($_.PSObject.Properties.Name -match "MinBlockSizeKB"){$_.MinBlockSizeKB = Get-SizeKB ($_.MinBlockSize)}
    }

    Write-Output $TapeDrive
}