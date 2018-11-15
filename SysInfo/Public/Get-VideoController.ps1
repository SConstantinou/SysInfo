function Get-VideoController {
<#
.SYNOPSIS

Gets the information about the capabilities and management
capacity of the video controller on a computer system
running Windows.

.DESCRIPTION

Gets the information about the capabilities and management
capacity of the video controller on a computer system
running Windows and converts all codes in results into
human readable format. Hardware that is not compatible with
Windows Display Driver Model (WDDM) returns inaccurate
property values

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

System.Array. Get-VideoController can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-VideoController returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-VideoController

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-VideoController -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-VideoController -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-VideoController -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-VideoController -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-VideoController -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-VideoController

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-VideoController -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-videocontroller
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_VideoController'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','DeviceID','VideoProcessor','VideoArchitecture','AdapterDACType','AdapterRAM','Status','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $VideoController = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $VideoController){

        [uint64]$AdapterRAM = $_.AdapterRAM

        switch ($AdapterRAM){
            {$AdapterRAM -ge 1KB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMKB" -Value "" -Force
                }
            {$AdapterRAM -ge 1MB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMMB" -Value "" -Force
                }
            {$AdapterRAM -ge 1GB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMGB" -Value "" -Force
                }
        }

    }

    foreach ($_ in $VideoController){

        $_.AcceleratorCapabilities = Get-AcceleratorCapabilitiesCode ($_.AcceleratorCapabilities)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CurrentScanMode = Get-CurrentScanMode ($_.CurrentScanMode)
        $_.DitherType = Get-DitherType ($_.DitherType)
        $_.ICMIntent = Get-ICMIntent ($_.ICMIntent)
        $_.ICMMethod = Get-ICMMethod ($_.ICMMethod)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.VideoArchitecture = Get-VideoArchitecture ($_.VideoArchitecture)
        $_.VideoMemoryType = Get-VideoMemoryType ($_.VideoMemoryType)
        if ($_.PSObject.Properties.Name -match "AdapterRAMKB"){$_.AdapterRAMKB = Get-SizeKB ($_.AdapterRAM)}
        if ($_.PSObject.Properties.Name -match "AdapterRAMMB"){$_.AdapterRAMMB = Get-SizeMB ($_.AdapterRAM)}
        if ($_.PSObject.Properties.Name -match "AdapterRAMGB"){$_.AdapterRAMGB = Get-SizeGB ($_.AdapterRAM)}
    }

    Optimize-Output -Object $VideoController -Properties $Properties -DefaultProperties $DefaultProperties
}