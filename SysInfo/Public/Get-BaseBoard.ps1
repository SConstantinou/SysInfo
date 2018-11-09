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

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-BaseBoard can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-BaseBoard returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-BaseBoard

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-BaseBoard

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-BaseBoard -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-baseboard
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_BaseBoard'
    [System.Collections.ArrayList]$DefaultProperties = 'Manufacturer','Model','Name','SerialNumber','SKU','Product'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $BaseBoard = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

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

    Optimize-Output -Object $BaseBoard -Properties $Properties -DefaultProperties $DefaultProperties
}