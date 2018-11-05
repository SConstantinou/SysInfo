function Get-CompactDisc {
<#
.SYNOPSIS

Gets the information of a data source that resolves to an actual
local storage device, that is compact disc type, on a computer
system running Windows.

.DESCRIPTION

Gets the information of a data source that resolves to an actual
local storage device, that is compact disc type, on a computer
system running Windows and converts all codes in results into
human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-CompactDisc can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-CompactDisc returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-CompactDisc

.EXAMPLE

PS C:\> Get-CompactDisc -ComputerName Server1

.EXAMPLE

PS C:\> Get-CompactDisc -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-CompactDisc -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-CompactDisc -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-CompactDisc -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-CompactDisc -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-CompactDisc

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-CompactDisc

.EXAMPLE

PS C:\> "Server1" | Get-CompactDisc

.EXAMPLE

PS C:\> "192.168.0.5" | Get-CompactDisc

.EXAMPLE

PS C:\> Get-CompactDisc -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-compactdisc
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    if ($Protocol -eq ''){

        $CompactDisc = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'Compact Disc'}}
    else{

        $CompactDisc = Get-LogicalDisk -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.DriveType -eq 'Compact Disc'}}

    Write-Output $CompactDisc
}