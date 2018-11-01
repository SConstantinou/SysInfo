function Get-BIOS {
<#
.SYNOPSIS

Gets the attributes of the computer system's basic input/output
services (BIOS) that are installed on a computer.

.DESCRIPTION

Gets the attributes of the computer system's basic input/output
services (BIOS) that are installed on a computer and converts
all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-BIOS can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-BIOS returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-BIOS

.EXAMPLE

PS C:\> Get-BIOS -ComputerName Server1

.EXAMPLE

PS C:\> Get-BIOS -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-BIOS -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-BIOS -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-BIOS -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-BIOS -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-BIOS

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-BIOS

.EXAMPLE

PS C:\> "Server1" | Get-BIOS

.EXAMPLE

PS C:\> "192.168.0.5" | Get-BIOS

.EXAMPLE

PS C:\> Get-BIOS -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-bios
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_BIOS'

    $Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name

    $BIOS = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $BIOS){

        $_.BiosCharacteristics = Get-BiosCharacteristicsCode ($_.BiosCharacteristics)
        $_.SoftwareElementState = Get-SoftwareElementState ($_.SoftwareElementState)
        $_.TargetOperatingSystem = Get-TargetOperatingSystem ($_.TargetOperatingSystem)
    }

    Write-Output $BIOS
}