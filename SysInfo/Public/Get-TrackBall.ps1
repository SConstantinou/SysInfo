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

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-TrackBall can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-TrackBall returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-TrackBall

This command gets the information from local system

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName Server1

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName "192.168.0.5"

This command gets the information from remote system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName Server1,Server2,Server3

This command gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName Server1 -Properties Name,Status

This command gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName Server1 -Properties *

This command gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-TrackBall

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-TrackBall -ComputerName Server1 -Protocol DCOM

This command gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-trackball
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    if ($Protocol -eq ''){

        $TrackBall = Get-PointingDevice -ComputerName $ComputerName -Properties $Properties | Where-Object {$_.PointingType -eq 'Track Ball'}}
    else{

        $TrackBall = Get-PointingDevice -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties | Where-Object {$_.PointingType -eq 'Track Ball'}}

    Write-Output $TrackBall
}