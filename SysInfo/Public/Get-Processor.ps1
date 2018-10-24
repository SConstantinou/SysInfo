function Get-Processor {
<#
.SYNOPSIS

Gets the information about a device that can interpret a sequence
of instructions on a computer running on a Windows operating system.

.DESCRIPTION

Gets the information about a device that can interpret a sequence
of instructions on a computer running on a Windows operating system
and converts all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-Processor can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-Processor returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-Processor

.EXAMPLE

PS C:\> Get-Processor -ComputerName Server1

.EXAMPLE

PS C:\> Get-Processor -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-Processor -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-Processor -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-Processor -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-Processor -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-Processor

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-Processor

.EXAMPLE

PS C:\> "Server1" | Get-Processor

.EXAMPLE

PS C:\> "192.168.0.5" | Get-Processor

.LINK

https://www.sconstantinou.com/get-processor
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_Processor).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $Processor = Get-CimInstance -ClassName Win32_Processor -Property $Properties | Select-Object $Properties
    }
    else{

        $Processor = Get-CimInstance -ClassName Win32_Processor -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Processor){

        [uint64]$L2CacheSize = $_.L2CacheSize * 1KB
        [uint64]$L3CacheSize = $_.L3CacheSize * 1KB

        if ($L2CacheSize -ge 1MB) {

            $Processor | Add-Member -MemberType NoteProperty -Name "L2CacheSizeMB" -Value "" -Force
        }

        if ($L3CacheSize -ge 1MB) {

            $Processor | Add-Member -MemberType NoteProperty -Name "L3CacheSizeMB" -Value "" -Force
        }

        if ($_.CurrentClockSpeed -ge 1000) {

            $Processor | Add-Member -MemberType NoteProperty -Name "CurrentClockSpeedGhz" -Value "" -Force
        }

        if ($_.MaxClockSpeed -ge 1000) {

            $Processor | Add-Member -MemberType NoteProperty -Name "MaxClockSpeedGhz" -Value "" -Force
        }
    }

    foreach ($_ in $Processor){

        $_.Architecture = Get-Architecture ($_.Architecture)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CpuStatus = Get-CpuStatus ($_.CpuStatus)
        $_.Family = Get-Family ($_.Family)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.ProcessorType = Get-ProcessorType ($_.ProcessorType)
        $_.UpgradeMethod = Get-UpgradeMethod ($_.UpgradeMethod)
        $_.VoltageCaps = Get-VoltageCap ($_.VoltageCaps)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)

        if ($_.PSObject.Properties.Name -match "L2CacheSizeMB"){

            $_.L2CacheSizeMB = Get-SizeMB ($_.L2CacheSize * 1KB)
        }

        if ($_.PSObject.Properties.Name -match "L3CacheSizeMB"){

            $_.L3CacheSizeMB = Get-SizeMB ($_.L3CacheSize * 1KB)
        }

        if ($_.PSObject.Properties.Name -match "CurrentClockSpeedGhz"){

            $_.CurrentClockSpeedGhz = [math]::round($_.CurrentClockSpeed / 1000,2)
        }

        if ($_.PSObject.Properties.Name -match "MaxClockSpeedGhz"){

            $_.MaxClockSpeedGhz = [math]::round($_.MaxClockSpeed / 1000,2)
        }
    }

    Write-Output $Processor
}