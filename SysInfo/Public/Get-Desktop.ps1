function Get-Desktop {
<#
.SYNOPSIS

Gets the information of the common characteristics of a user's
desktop.

.DESCRIPTION

Gets the information of the common characteristics of a user's
desktop and converts all codes in results into human readable
format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-Desktop can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Desktop returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Desktop

.EXAMPLE

PS C:\> Get-Desktop -ComputerName Server1

.EXAMPLE

PS C:\> Get-Desktop -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-Desktop -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-Desktop -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-Desktop -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-Desktop -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-Desktop

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-Desktop

.EXAMPLE

PS C:\> "Server1" | Get-Desktop

.EXAMPLE

PS C:\> "192.168.0.5" | Get-Desktop

.LINK

https://www.sconstantinou.com/get-desktop
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Desktop).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Desktop = Get-CimInstance -ClassName Win32_Desktop -Property $Properties | Select-Object $Properties
    }
    else{

        $Desktop = Get-CimInstance -ClassName Win32_Desktop -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    Write-Output $Desktop
}