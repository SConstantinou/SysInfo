﻿function Get-SystemEnclosure {
<#
.SYNOPSIS

Gets the information that is associated with a physical
system enclosure.

.DESCRIPTION

Gets the information that is associated with a physical
system enclosure and converts all codes in results into
human readable format.

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

System.Array. Get-SystemEnclosure can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-SystemEnclosure returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-SystemEnclosure

This command gets the information from local system

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName "192.168.0.5"

This command gets the information from remote system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1,Server2,Server3

This command gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1 -Properties Name,Status

This command gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1 -Properties *

This command gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-SystemEnclosure

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1 -Protocol DCOM

This command gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-systemenclosure
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_SystemEnclosure'
    [System.Collections.ArrayList]$DefaultProperties = 'Manufacturer','Model','LockPresent','SerialNumber','SMBIOSAssetTag','SecurityStatus'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $SystemEnclosure = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $SystemEnclosure){

        if ($null -ne $_.Depth){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "DepthCM" -Value "$(Get-LengthCM ($_.Depth))" -Force
        }

        if ($null -ne $_.Height){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "HeightCM" -Value "$(Get-LengthCM ($_.Height))" -Force
        }

        if ($null -ne $_.Width){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WidthCM" -Value "$(Get-LengthCM ($_.Width))" -Force
        }

        if ($null -ne $_.Weight){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WeightGr" -Value "$(Get-WeightGram ($_.Weight))" -Force
        }

        if (($_.PSObject.Properties.Name -match "WeightGr") -and ($BaseBoard.WeightGr -ge 1000)){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WeightKg" -Value "$(Get-WeightKg ($_.Weight))" -Force
        }

        $_.ChassisTypes = Get-ChassisType ($_.ChassisTypes)
        $_.SecurityBreach = Get-SecurityBreach ($_.SecurityBreach)
        $_.SecurityStatus = Get-SecurityStatus ($_.SecurityStatus)
        $_.ServicePhilosophy = Get-ServicePhilosophy ($_.ServicePhilosophy)
    }

    Optimize-Output -Object $SystemEnclosure -Properties $Properties -DefaultProperties $DefaultProperties
}