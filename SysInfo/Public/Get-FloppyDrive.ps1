function Get-FloppyDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_FloppyDrive).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $FloppyDrive = Get-CimInstance -ClassName Win32_FloppyDrive -Property $Properties | Select-Object $Properties
    }
    else{

        $FloppyDrive = Get-CimInstance -ClassName Win32_FloppyDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $FloppyDrive){

        if ($_.DefaultBlockSize -gt 1KB) {

            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "DefaultBlockSizeKB" -Value "" -Force
        }

        if ($_.MaxBlockSize -gt 1KB) {

            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "MaxBlockSizeKB" -Value "" -Force
        }

        if ($_.MaxMediaSize -gt 1MB) {
            
            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "MaxMediaSizeMB" -Value "" -Force
        }

        if ($_.MinBlockSize -gt 1KB) {

            $FloppyDrive | Add-Member -MemberType NoteProperty -Name "MinBlockSizeKB" -Value "" -Force
        }

    }

    foreach ($_ in $FloppyDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "DefaultBlockSizeKB"){$_.DefaultBlockSizeKB = Get-SizeKB ($_.DefaultBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxBlockSizeKB"){$_.MaxBlockSizeKB = Get-SizeKB ($_.MaxBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeMB"){$_.MaxMediaSizeMB = Get-SizeMB ($_.MaxMediaSize)}
        if ($_.PSObject.Properties.Name -match "MinBlockSizeKB"){$_.MinBlockSizeKB = Get-SizeKB ($_.MinBlockSize)}
    }
    
    Write-Output $FloppyDrive
}