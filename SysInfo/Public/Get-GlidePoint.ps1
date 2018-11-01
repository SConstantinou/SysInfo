function Get-GlidePoint {
<#
.SYNOPSIS

Gets the information a glide point input device.

.DESCRIPTION

Gets the information a glide point input device and converts
all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-GlidePoint can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-GlidePoint returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-GlidePoint

.EXAMPLE

PS C:\> Get-GlidePoint -ComputerName Server1

.EXAMPLE

PS C:\> Get-GlidePoint -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-GlidePoint -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-GlidePoint -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-GlidePoint -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-GlidePoint -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-GlidePoint

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-GlidePoint

.EXAMPLE

PS C:\> "Server1" | Get-GlidePoint

.EXAMPLE

PS C:\> "192.168.0.5" | Get-GlidePoint

.EXAMPLE

PS C:\> Get-GlidePoint -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-glidepoint
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $GlidePoint = Get-PointingDevice -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.PointingType -eq 'Glide Point'}

    Write-Output $GlidePoint
}