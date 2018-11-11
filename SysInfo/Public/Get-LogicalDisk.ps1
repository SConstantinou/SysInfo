﻿function Get-LogicalDisk {
<#
.SYNOPSIS

Gets the information about a data source that resolves to an
actual local storage device on a computer system running Windows.

.DESCRIPTION

Gets the information about a data source that resolves to an
actual local storage device on a computer system running Windows
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

System.Array. Get-LogicalDisk can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-LogicalDisk returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-LogicalDisk

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-LogicalDisk -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-LogicalDisk -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-LogicalDisk -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-LogicalDisk -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties

.EXAMPLE

PS C:\> Get-LogicalDisk -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-LogicalDisk

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-LogicalDisk -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-logicaldisk
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_LogicalDisk'
    [System.Collections.ArrayList]$DefaultProperties = 'DeviceID','DriveType','ProviderName','VolumeName','Size','FreeSpace','FreeSpacePercentage','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $LogicalDisk = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "FreeSpacePercentage" -Value "" -Force
    $LogicalDisk | Add-Member -MemberType NoteProperty -Name "UsedSpacePercentage" -Value "" -Force

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

        if ($Size -ne 0){

            [uint64]$FreeSpacePercentageCalculation = $FreeSpace * 100 / $Size
            $_.FreeSpacePercentage = [math]::Round($FreeSpacePercentageCalculation,2)
            [uint64]$FreeSpacePercentage = $_.FreeSpacePercentage
            $_.UsedSpacePercentage = 100 - ($FreeSpacePercentage)
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

    Optimize-Output -Object $LogicalDisk -Properties $Properties -DefaultProperties $DefaultProperties
}