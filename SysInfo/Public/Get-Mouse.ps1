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

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-Mouse can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Mouse returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Mouse

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-Mouse -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-Mouse

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-Mouse -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-mouse
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    if ($Protocol -eq ''){

        $Mouse = Get-PointingDevice -ComputerName $ComputerName -Properties $Properties | Where-Object {$_.PointingType -eq 'Mouse'}}
    else{

        $Mouse = Get-PointingDevice -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties | Where-Object {$_.PointingType -eq 'Mouse'}}

    Write-Output $Mouse
}