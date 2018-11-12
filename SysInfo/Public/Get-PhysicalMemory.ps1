function Get-PhysicalMemory {
<#
.SYNOPSIS

Gets the information about a physical memory device located on a
computer system and available to the operating system.

.DESCRIPTION

Gets the information about a physical memory device located on a
computer system and available to the operating system and converts
all codes in results into human readable format.

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

System.Array. Get-PhysicalMemory can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PhysicalMemory returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PhysicalMemory

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\>  Get-NetworkAdapterConfiguration -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties

.EXAMPLE

PS C:\>  Get-NetworkAdapterConfiguration -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-PhysicalMemory

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-physicalmemory
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_PhysicalMemory'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','PartNumber','SerialNumber','Speed','DeviceLocator','Manufacturer','Tag','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $PhysicalMemory = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    foreach ($_ in $PhysicalMemory){

        [uint64]$Capacity = $_.Capacity

        switch ($Capacity){
            {$Capacity -gt 1KB}
                {
                    $PhysicalMemory | Add-Member -MemberType NoteProperty -Name "CapacityKB" -Value "" -Force
                }
            {$Capacity -gt 1MB}
                {
                    $PhysicalMemory | Add-Member -MemberType NoteProperty -Name "CapacityMB" -Value "" -Force
                }
            {$Capacity -gt 1GB}
                {
                    $PhysicalMemory | Add-Member -MemberType NoteProperty -Name "CapacityGB" -Value "" -Force
                }
        }

    }

    foreach ($_ in $PhysicalMemory){

        $_.FormFactor = Get-FormFactor ($_.FormFactor)
        $_.InterleavePosition = Get-InterleavePosition ($_.InterleavePosition)
        $_.MemoryType = Get-MemoryType ($_.MemoryType)
        $_.TypeDetail = Get-TypeDetail ($_.TypeDetail)
        if ($_.PSObject.Properties.Name -match "CapacityKB"){$_.CapacityKB = Get-SizeKB ($_.Capacity)}
        if ($_.PSObject.Properties.Name -match "CapacityMB"){$_.CapacityMB = Get-SizeMB ($_.Capacity)}
        if ($_.PSObject.Properties.Name -match "CapacityGB"){$_.CapacityGB = Get-SizeGB ($_.Capacity)}
    }

    Optimize-Output -Object $PhysicalMemory -Properties $Properties -DefaultProperties $DefaultProperties
}