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

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-DiskPartition can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-DiskPartition returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-DiskPartition

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-DiskPartition

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-DiskPartition -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-diskpartition
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_DiskPartition'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','NumberOfBlocks','BootPartition','PrimaryPartition','Size','Index','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $DiskPartition = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

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

    Optimize-Output -Object $DiskPartition -Properties $Properties -DefaultProperties $DefaultProperties
}