function Get-LocalDisk {
<#
.SYNOPSIS

Gets the information of a local disk on a computer running
on a Windows operating system.

.DESCRIPTION

Gets the information of a local disk on a computer running
on a Windows operating system and converts all codes in results
into human readable format.

.PARAMETER ComputerName

Specifies the computer name or IP Address of the system that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-LocalDisk can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-LocalDisk returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-LocalDisk

.EXAMPLE

PS C:\> Get-LocalDisk -ComputerName Server1

.EXAMPLE

PS C:\> Get-LocalDisk -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-LocalDisk -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-LocalDisk -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-LocalDisk -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-LocalDisk -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-LocalDisk

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-LocalDisk

.EXAMPLE

PS C:\> "Server1" | Get-LocalDisk

.EXAMPLE

PS C:\> "192.168.0.5" | Get-LocalDisk

.EXAMPLE

PS C:\> Get-LocalDisk -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-localdisk
#>
    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $LocalDisk = Get-LogicalDisk -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.DriveType -eq 'Local Disk'}


    Write-Output $LocalDisk
}