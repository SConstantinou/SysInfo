function Get-BaseBoard {
<#
.SYNOPSIS

Gets the information of a baseboard.

.DESCRIPTION

Gets the information of a baseboard and converts all codes
in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-BaseBoard can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-BaseBoard returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-BaseBoard

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName Server1

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-BaseBoard -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-BaseBoard -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-BaseBoard

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-BaseBoard

.EXAMPLE

PS C:\> "Server1" | Get-BaseBoard

.EXAMPLE

PS C:\> "192.168.0.5" | Get-BaseBoard

.LINK

https://www.sconstantinou.com/get-baseboard
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_BaseBoard'
    
    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $BaseBoard = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $BaseBoard){

        if ($null -ne $_.Depth){
            $BaseBoard |
                Add-Member -MemberType NoteProperty -Name "DepthCM" -Value "" -Force
        }

        if ($null -ne $_.Height){
            $BaseBoard |
                Add-Member -MemberType NoteProperty -Name "HeightCM" -Value "" -Force
        }

        if ($null -ne $_.Width){
            $BaseBoard |
                Add-Member -MemberType NoteProperty -Name "WidthCM" -Value "" -Force
        }

        if ($null -ne $_.Weight){
            $BaseBoard |
                Add-Member -MemberType NoteProperty -Name "WeightGr" -Value "" -Force
        }
    }

    Foreach ($_ in $BaseBoard){

        if ($_.PSObject.Properties.Name -match "DepthCM"){$_.DepthCM = Get-LengthCM ($_.Depth)}
        if ($_.PSObject.Properties.Name -match "HeightCM"){$_.HeightCM = Get-LengthCM ($_.Height)}
        if ($_.PSObject.Properties.Name -match "WidthCM"){$_.WidthCM = Get-LengthCM ($_.Width)}
        if ($_.PSObject.Properties.Name -match "WeightGr"){$_.WeightGr = Get-WeightGram ($_.Weight)}
    }

    foreach ($_ in $BaseBoard){

        if (($BaseBoard.PSObject.Properties.Name -match "WeightGr") -and ($_.WeightGr -ge 1000)){
            $BaseBoard |
                Add-Member -MemberType NoteProperty -Name "WeightKg" -Value "" -Force
        }
    }

    foreach ($_ in $BaseBoard){

        if ($_.PSObject.Properties.Name -match "WeightKg"){$_.WeightKg = Get-WeightKg ($_.Weight)}
    }

    Write-Output $BaseBoard
}