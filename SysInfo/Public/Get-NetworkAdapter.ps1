function Get-NetworkAdapter {
<#
.SYNOPSIS

Gets the information about a network adapter of a computer
running a Windows operating system.

.DESCRIPTION

Gets the information about a network adapter of a computer
running a Windows operating system and converts all
codes in results into human readable format.Get-NetworkAdapter
only supplies IPv4 data.

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

System.Array. Get-NetworkAdapter can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-NetworkAdapter returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-NetworkAdapter

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\>  Get-NetworkAdapter -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties

.EXAMPLE

PS C:\>  Get-NetworkAdapter -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-NetworkAdapter

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-networkadapter
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_NetworkAdapter'
    [System.Collections.ArrayList]$DefaultProperties = 'DeviceID','Name','AdapterType','ServiceName','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $NetworkAdapter = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $NetworkAdapter){

        [uint64]$Speed = $_.Speed

        switch ($Speed){
            {$Speed -ge 1000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedKbps" -Value "" -Force
                }
            {$Speed -ge 1000000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedMbps" -Value "" -Force
                }
            {$Speed -ge 1000000000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedGbps" -Value "" -Force
                }
        }
    }

    foreach ($_ in $NetworkAdapter){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.NetConnectionStatus = Get-NetConnectionStatus ($_.NetConnectionStatus)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "SpeedKbps"){$_.SpeedKbps = Get-SpeedKbpsConversion ($_.Speed)}
        if ($_.PSObject.Properties.Name -match "SpeedMbps"){$_.SpeedMbps = Get-SpeedMbpsConversion ($_.Speed)}
        if ($_.PSObject.Properties.Name -match "SpeedGbps"){$_.SpeedGbps = Get-SpeedGbpsConversion ($_.Speed)}
    }

    Optimize-Output -Object $NetworkAdapter -Properties $Properties -DefaultProperties $DefaultProperties
}