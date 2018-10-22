function Get-DiskDrive {
<#
.SYNOPSIS

Gets a physical disk drive as seen by a computer running
the Windows operating system.

.DESCRIPTION

Gets a physical disk drive as seen by a computer running
the Windows operating system and converts all codes in results
into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-DiskDrive can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-DiskDrive returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-DiskDrive

.EXAMPLE

PS C:\> Get-DiskDrive -ComputerName Server1

.EXAMPLE

PS C:\> Get-DiskDrive -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-DiskDrive -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-DiskDrive -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-DiskDrive -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-DiskDrive -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-DiskDrive

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-DiskDrive

.EXAMPLE

PS C:\> "Server1" | Get-DiskDrive

.EXAMPLE

PS C:\> "192.168.0.5" | Get-DiskDrive

.LINK

https://www.sconstantinou.com/get-diskdrive
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_DiskDrive).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $DiskDrive = Get-CimInstance -ClassName Win32_DiskDrive -Property $Properties | Select-Object $Properties
    }
    else{

        $DiskDrive = Get-CimInstance -ClassName Win32_DiskDrive -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DiskDrive){

        [uint64]$MaxMediaSize = $_.MaxMediaSize * 1KB
        [uint64]$Size = $_.Size

        if ($_.DefaultBlockSize -ge 1KB) {

            $DiskDrive | Add-Member -MemberType NoteProperty -Name "DefaultBlockSizeKB" -Value "" -Force
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

        switch ($Size){
            {$Size -ge 1KB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeKB" -Value "" -Force
                }
            {$Size -ge 1MB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeMB" -Value "" -Force
                }
            {$Size -ge 1GB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeGB" -Value "" -Force
                }
            {$Size -ge 1TB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizeTB" -Value "" -Force
                }
            {$Size -ge 1PB}
                {
                    $DiskDrive | Add-Member -MemberType NoteProperty -Name "SizePB" -Value "" -Force
                }
        }
    }

    foreach ($_ in $DiskDrive){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "DefaultBlockSizeKB"){$_.DefaultBlockSizeKB = Get-SizeKB ($_.DefaultBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxBlockSizeKB"){$_.MaxBlockSizeKB = Get-SizeKB ($_.MaxBlockSize)}
        if ($_.PSObject.Properties.Name -match "MinBlockSizeKB"){$_.MinBlockSizeKB = Get-SizeKB ($_.MinBlockSize)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeMB"){$_.MaxMediaSizeMB = Get-SizeMB ($_.MaxMediaSize * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxMediaSizeGB"){$_.MaxMediaSizeGB = Get-SizeGB ($_.MaxMediaSize * 1KB)}
	if ($_.PSObject.Properties.Name -match "MaxMediaSizeTB"){$_.MaxMediaSizeTB = Get-SizeTB ($_.MaxMediaSize * 1KB)}
        if ($_.PSObject.Properties.Name -match "SizeKB"){$_.SizeKB = Get-SizeKB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeMB"){$_.SizeMB = Get-SizeMB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeGB"){$_.SizeGB = Get-SizeGB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizeTB"){$_.SizeTB = Get-SizeTB ($_.Size)}
        if ($_.PSObject.Properties.Name -match "SizePB"){$_.SizePB = Get-SizePB ($_.Size)}
    }

    Write-Output $DiskDrive
}