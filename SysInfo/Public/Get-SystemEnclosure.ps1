function Get-SystemEnclosure {
<#
.SYNOPSIS

Gets the information that is associated with a physical
system enclosure.

.DESCRIPTION

Gets the information that is associated with a physical
system enclosure and converts all codes in results into
human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.INPUTS

System.Array. Get-SystemEnclosure can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-SystemEnclosure returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-SystemEnclosure

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-SystemEnclosure -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-SystemEnclosure -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-SystemEnclosure

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-SystemEnclosure

.EXAMPLE

PS C:\> "Server1" | Get-SystemEnclosure

.EXAMPLE

PS C:\> "192.168.0.5" | Get-SystemEnclosure

.EXAMPLE

PS C:\> Get-SystemEnclosure -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-systemenclosure
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_SystemEnclosure'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $SystemEnclosure = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

    foreach ($_ in $SystemEnclosure){

        if ($null -ne $_.Depth){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "DepthCM" -Value "$(Get-LengthCM ($_.Depth))" -Force
        }

        if ($null -ne $_.Height){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "HeightCM" -Value "$(Get-LengthCM ($_.Height))" -Force
        }

        if ($null -ne $_.Width){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WidthCM" -Value "$(Get-LengthCM ($_.Width))" -Force
        }

        if ($null -ne $_.Weight){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WeightGr" -Value "$(Get-WeightGram ($_.Weight))" -Force
        }

        if (($_.PSObject.Properties.Name -match "WeightGr") -and ($BaseBoard.WeightGr -ge 1000)){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WeightKg" -Value "$(Get-WeightKg ($_.Weight))" -Force
        }

        $_.ChassisTypes = Get-ChassisType ($_.ChassisTypes)
        $_.SecurityBreach = Get-SecurityBreach ($_.SecurityBreach)
        $_.SecurityStatus = Get-SecurityStatus ($_.SecurityStatus)
        $_.ServicePhilosophy = Get-ServicePhilosophy ($_.ServicePhilosophy)
    }

    Write-Output $SystemEnclosure
}