function Get-Mouse {
<#
.SYNOPSIS

Gets the information a mouse input device.

.DESCRIPTION

Gets the information a mouse input device and converts all
codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-Mouse can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Mouse returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Mouse

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1

.EXAMPLE

PS C:\> Get-Mouse -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-Mouse -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-Mouse -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-Mouse -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-Mouse

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-Mouse

.EXAMPLE

PS C:\> "Server1" | Get-Mouse

.EXAMPLE

PS C:\> "192.168.0.5" | Get-Mouse

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-mouse
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $Mouse = Get-PointingDevice -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.PointingType -eq 'Mouse'}

    Write-Output $Mouse
}