function Get-TouchPad {
<#
.SYNOPSIS

Gets the information about touch pad input device on
computer system running Windows.

.DESCRIPTION

Gets the information about touch pad input device on
computer system running Windows and converts all codes
in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-TouchPad can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-TouchPad returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-TouchPad

.EXAMPLE

PS C:\> Get-TouchPad -ComputerName Server1

.EXAMPLE

PS C:\> Get-TouchPad -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-TouchPad -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-TouchPad -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-TouchPad -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-TouchPad -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-TouchPad

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-TouchPad

.EXAMPLE

PS C:\> "Server1" | Get-TouchPad

.EXAMPLE

PS C:\> "192.168.0.5" | Get-TouchPad

.EXAMPLE

PS C:\> Get-TouchPad -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-touchpad
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $TouchPad = Get-PointingDevice -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.PointingType -eq 'Touch Pad'}

    Write-Output $TouchPad
}