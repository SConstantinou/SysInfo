function Get-NetworkAdapter {
<#
.SYNOPSIS

Gets the information about a network adapter of a computer
running a Windows operating system.

.DESCRIPTION

Gets the information about a network adapter of a computer
running a Windows operating system and converts all
codes in results into human readable format.Get-NetworkAdapter
only supplies IPv4 data.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-NetworkAdapter can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-NetworkAdapter returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-NetworkAdapter

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName Server1

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-NetworkAdapter -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-NetworkAdapter -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-NetworkAdapter -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-NetworkAdapter

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-NetworkAdapter

.EXAMPLE

PS C:\> "Server1" | Get-NetworkAdapter

.EXAMPLE

PS C:\> "192.168.0.5" | Get-NetworkAdapter

.LINK

https://www.sconstantinou.com/get-networkadapter
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_NetworkAdapter).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $NetworkAdapter = Get-CimInstance -ClassName Win32_NetworkAdapter -Property $Properties | Select-Object $Properties
    }
    else{

        $NetworkAdapter = Get-CimInstance -ClassName Win32_NetworkAdapter -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $NetworkAdapter){

        [uint64]$Speed = $_.Speed

        switch ($Speed){
            {$Speed -ge 1000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedKbps" -Value "" -Force
                }
            {$Speed -ge 1000000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedMbps" -Value "" -Force
                }
            {$Speed -ge 1000000000}
                {
                    $NetworkAdapter | Add-Member -MemberType NoteProperty -Name "SpeedGbps" -Value "" -Force
                }
        }
    }

    foreach ($_ in $NetworkAdapter){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.NetConnectionStatus = Get-NetConnectionStatus ($_.NetConnectionStatus)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "SpeedKbps"){$_.SpeedKbps = Get-SpeedKbpsConversion ($_.Speed)}
        if ($_.PSObject.Properties.Name -match "SpeedMbps"){$_.SpeedMbps = Get-SpeedMbpsConversion ($_.Speed)}
        if ($_.PSObject.Properties.Name -match "SpeedGbps"){$_.SpeedGbps = Get-SpeedGbpsConversion ($_.Speed)}
    }

    Write-Output $NetworkAdapter
}