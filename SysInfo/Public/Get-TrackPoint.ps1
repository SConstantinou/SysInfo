function Get-TrackPoint {
<#
.SYNOPSIS

Gets the information about track point input device on
computer system running Windows.

.DESCRIPTION

Gets the information about track point input device on
computer system running Windows and converts all codes
in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-TrackPoint can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-TrackPoint returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-TrackPoint

.EXAMPLE

PS C:\> Get-TrackPoint -ComputerName Server1

.EXAMPLE

PS C:\> Get-TrackPoint -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-TrackPoint -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-TrackPoint -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-TrackPoint -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-TrackPoint -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-TrackPoint

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-TrackPoint

.EXAMPLE

PS C:\> "Server1" | Get-TrackPoint

.EXAMPLE

PS C:\> "192.168.0.5" | Get-TrackPoint

.LINK

https://www.sconstantinou.com/get-trackpoint
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $TrackPoint = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Track Point'}
    }
    else{

        $TrackPoint = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Track Point'}
    }

    Write-Output $TrackPoint
}