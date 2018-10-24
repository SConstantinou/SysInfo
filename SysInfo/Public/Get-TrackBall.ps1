function Get-TrackBall {
<#
.SYNOPSIS

Gets the information about track ball input device on
computer system running Windows.

.DESCRIPTION

Gets the information about track ball input device on
computer system running Windows and converts all codes
in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-TrackBall can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-TrackBall returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-TrackBall

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName Server1

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-TrackBall -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-TrackBall -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-TrackBall

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-TrackBall

.EXAMPLE

PS C:\> "Server1" | Get-TrackBall

.EXAMPLE

PS C:\> "192.168.0.5" | Get-TrackBall

.LINK

https://www.sconstantinou.com/get-trackball
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $TrackBall = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Track Ball'}
    }
    else{

        $TrackBall = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Track Ball'}
    }

    Write-Output $TrackBall
}