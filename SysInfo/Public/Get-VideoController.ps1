function Get-VideoController {
<#
.SYNOPSIS

Gets the information about the capabilities and management
capacity of the video controller on a computer system
running Windows.

.DESCRIPTION

Gets the information about the capabilities and management
capacity of the video controller on a computer system
running Windows and converts all codes in results into
human readable format. Hardware that is not compatible with
Windows Display Driver Model (WDDM) returns inaccurate
property values

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-VideoController can accept a string value to
determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-VideoController returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-VideoController

.EXAMPLE

PS C:\> Get-VideoController -ComputerName Server1

.EXAMPLE

PS C:\> Get-VideoController -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-VideoController -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-VideoController -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-VideoController -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-VideoController -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-VideoController

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-VideoController

.EXAMPLE

PS C:\> "Server1" | Get-VideoController

.EXAMPLE

PS C:\> "192.168.0.5" | Get-VideoController

.LINK

https://www.sconstantinou.com/get-videocontroller
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_VideoController).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $VideoController = Get-CimInstance -ClassName Win32_VideoController -Property $Properties | Select-Object $Properties
    }
    else{

        $VideoController = Get-CimInstance -ClassName Win32_VideoController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $VideoController){

        [uint64]$AdapterRAM = $_.AdapterRAM

        switch ($AdapterRAM){
            {$AdapterRAM -ge 1KB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMKB" -Value "" -Force
                }
            {$AdapterRAM -ge 1MB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMMB" -Value "" -Force
                }
            {$AdapterRAM -ge 1GB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMGB" -Value "" -Force
                }
        }

    }

    foreach ($_ in $VideoController){

        $_.AcceleratorCapabilities = Get-AcceleratorCapabilitiesCode ($_.AcceleratorCapabilities)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CurrentScanMode = Get-CurrentScanMode ($_.CurrentScanMode)
        $_.DitherType = Get-DitherType ($_.DitherType)
        $_.ICMIntent = Get-ICMIntent ($_.ICMIntent)
        $_.ICMMethod = Get-ICMMethod ($_.ICMMethod)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.ProtocolSupported = Get-ProtocolSupported ($_.ProtocolSupported)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        $_.VideoArchitecture = Get-VideoArchitecture ($_.VideoArchitecture)
        $_.VideoMemoryType = Get-VideoMemoryType ($_.VideoMemoryType)
        if ($_.PSObject.Properties.Name -match "AdapterRAMKB"){$_.AdapterRAMKB = Get-SizeKB ($_.AdapterRAM)}
        if ($_.PSObject.Properties.Name -match "AdapterRAMMB"){$_.AdapterRAMMB = Get-SizeMB ($_.AdapterRAM)}
        if ($_.PSObject.Properties.Name -match "AdapterRAMGB"){$_.AdapterRAMGB = Get-SizeGB ($_.AdapterRAM)}
    }

    Write-Output $VideoController
}