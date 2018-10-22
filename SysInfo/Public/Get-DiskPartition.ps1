function Get-DiskPartition {
<#
.SYNOPSIS

Gets the capabilities and management capacity of a partitioned
area of a physical disk on a computer system running Windows.

.DESCRIPTION

Gets the capabilities and management capacity of a partitioned
area of a physical disk on a computer system running Windows
and converts all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-DiskPartition can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-DiskPartition returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-DiskPartition

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName Server1

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-DiskPartition -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-DiskPartition -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-DiskPartition

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-DiskPartition

.EXAMPLE

PS C:\> "Server1" | Get-DiskPartition

.EXAMPLE

PS C:\> "192.168.0.5" | Get-DiskPartition

.LINK

https://www.sconstantinou.com/get-diskpartition
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_DiskPartition).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
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
            {$Size -ge 1KB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeKB" -Value "" -Force
                }
            {$Size -ge 1MB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeMB" -Value "" -Force
                }
            {$Size -ge 1GB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeGB" -Value "" -Force
                }
            {$Size -ge 1TB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizeTB" -Value "" -Force
                }
            {$Size -ge 1PB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "SizePB" -Value "" -Force
                }
        }

        if ($_.BlockSize -ge 1KB) {

            $DiskPartition | Add-Member -MemberType NoteProperty -Name "BlockSizeKB" -Value "" -Force
        }

        switch ($StartingOffset){
            {$StartingOffset -ge 1KB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetKB" -Value "" -Force
                }
            {$StartingOffset -ge 1MB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetMB" -Value "" -Force
                }
            {$StartingOffset -ge 1GB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetGB" -Value "" -Force
                }
            {$StartingOffset -ge 1TB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetTB" -Value "" -Force
                }
            {$StartingOffset -ge 1PB}
                {
                    $DiskPartition | Add-Member -MemberType NoteProperty -Name "StartingOffsetPB" -Value "" -Force
                }
        }

    }

    foreach ($_ in $DiskPartition){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
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