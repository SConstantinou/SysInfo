function Get-Processor {
<#
.SYNOPSIS

Gets the information about a device that can interpret a sequence
of instructions on a computer running on a Windows operating system.

.DESCRIPTION

Gets the information about a device that can interpret a sequence
of instructions on a computer running on a Windows operating system
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

System.Array. Get-Processor can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Processor returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Processor

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-Processor -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-Processor -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-Processor -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-Processor -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-Processor -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-Processor

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-Processor -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-processor
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_Processor'
    [System.Collections.ArrayList]$DefaultProperties = 'DeviceID','Name','Caption','MaxClockSpeed','SocketDesignation','Manufacturer','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $Processor = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $Processor){

        [uint64]$L2CacheSize = $_.L2CacheSize * 1KB
        [uint64]$L3CacheSize = $_.L3CacheSize * 1KB

        if ($L2CacheSize -ge 1MB) {

            $Processor | Add-Member -MemberType NoteProperty -Name "L2CacheSizeMB" -Value "" -Force
        }

        if ($L3CacheSize -ge 1MB) {

            $Processor | Add-Member -MemberType NoteProperty -Name "L3CacheSizeMB" -Value "" -Force
        }

        if ($_.CurrentClockSpeed -ge 1000) {

            $Processor | Add-Member -MemberType NoteProperty -Name "CurrentClockSpeedGhz" -Value "" -Force
        }

        if ($_.MaxClockSpeed -ge 1000) {

            $Processor | Add-Member -MemberType NoteProperty -Name "MaxClockSpeedGhz" -Value "" -Force
        }
    }

    foreach ($_ in $Processor){

        $_.Architecture = Get-Architecture ($_.Architecture)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CpuStatus = Get-CpuStatus ($_.CpuStatus)
        $_.Family = Get-Family ($_.Family)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.ProcessorType = Get-ProcessorType ($_.ProcessorType)
        $_.UpgradeMethod = Get-UpgradeMethod ($_.UpgradeMethod)
        $_.VoltageCaps = Get-VoltageCap ($_.VoltageCaps)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)

        if ($_.PSObject.Properties.Name -match "L2CacheSizeMB"){

            $_.L2CacheSizeMB = Get-SizeMB ($_.L2CacheSize * 1KB)
        }

        if ($_.PSObject.Properties.Name -match "L3CacheSizeMB"){

            $_.L3CacheSizeMB = Get-SizeMB ($_.L3CacheSize * 1KB)
        }

        if ($_.PSObject.Properties.Name -match "CurrentClockSpeedGhz"){

            $_.CurrentClockSpeedGhz = [math]::round($_.CurrentClockSpeed / 1000,2)
        }

        if ($_.PSObject.Properties.Name -match "MaxClockSpeedGhz"){

            $_.MaxClockSpeedGhz = [math]::round($_.MaxClockSpeed / 1000,2)
        }
    }

    Optimize-Output -Object $Processor -Properties $Properties -DefaultProperties $DefaultProperties
}