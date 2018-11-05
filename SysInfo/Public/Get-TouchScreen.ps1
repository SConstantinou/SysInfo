function Get-TouchScreen {
<#
.SYNOPSIS

Gets the information about touch screen input device on
computer system running Windows.

.DESCRIPTION

Gets the information about touch screen input device on
computer system running Windows and converts all codes
in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-TouchScreen can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-TouchScreen returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-TouchScreen

.EXAMPLE

PS C:\> Get-TouchScreen -ComputerName Server1

.EXAMPLE

PS C:\> Get-TouchScreen -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-TouchScreen -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-TouchScreen -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-TouchScreen -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-TouchScreen -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-TouchScreen

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-TouchScreen

.EXAMPLE

PS C:\> "Server1" | Get-TouchScreen

.EXAMPLE

PS C:\> "192.168.0.5" | Get-TouchScreen

.EXAMPLE

PS C:\> Get-TouchScreen -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-touchscreen
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    if ($Protocol -eq ''){

        $TouchScreen = Get-PointingDevice -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.PointingType -eq 'Touch Screen'}}
    else{

        $TouchScreen = Get-PointingDevice -ComputerName $ComputerName -Protocol $Protocol | Where-Object {$_.PointingType -eq 'Touch Screen'}}

    Write-Output $TouchScreen
}