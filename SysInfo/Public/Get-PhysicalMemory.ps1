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

.INPUTS

System.Array. Get-PhysicalMemory can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PhysicalMemory returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PhysicalMemory

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName Server1

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-PhysicalMemory -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-PhysicalMemory -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-PhysicalMemory

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-PhysicalMemory

.EXAMPLE

PS C:\> "Server1" | Get-PhysicalMemory

.EXAMPLE

PS C:\> "192.168.0.5" | Get-PhysicalMemory

.EXAMPLE

PS C:\> Get-PhysicalMemory -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-physicalmemory
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_PhysicalMemory'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $PhysicalMemory = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

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

    Write-Output $PhysicalMemory
}