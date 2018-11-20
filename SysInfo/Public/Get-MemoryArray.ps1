﻿function Get-MemoryArray {
<#
.SYNOPSIS

Gets the properties of the computer system memory array and
mapped addresses.

.DESCRIPTION

Gets the properties of the computer system memory array and
mapped addresses and converts all codes in results into human
readable format.

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

System.Array. Get-MemoryArray can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-MemoryArray returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-MemoryArray

This command gets the information from local system

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName Server1

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName "192.168.0.5"

This command gets the information from remote system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName Server1,Server2,Server3

This command gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName Server1 -Properties Name,Status

This command gets the information from Server1 and will output only Name
and Status Properties

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName Server1 -Properties *

This command gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-MemoryArray

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-MemoryArray -ComputerName Server1 -Protocol DCOM

This command gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-memoryarray
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_MemoryArray'
    [System.Collections.ArrayList]$DefaultProperties = 'DeviceID','Name','StartingAddress','EndingAddress','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $MemoryArray = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $MemoryArray){

        $_.Access = Get-Access ($_.Access)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.ErrorAccess = Get-ErrorAccess ($_.ErrorAccess)
        $_.ErrorDataOrder = Get-ErrorDataOrder ($_.ErrorDataOrder)
        $_.ErrorGranularity = Get-ErrorGranularity ($_.ErrorGranularity)
        $_.ErrorInfo = Get-ErrorInfo ($_.ErrorInfo)
    }

    Optimize-Output -Object $MemoryArray -Properties $Properties -DefaultProperties $DefaultProperties
}