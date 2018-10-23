﻿function Get-PrinterInfo {
<#
.SYNOPSIS

Gets the information about a device connected to a computer
running on a Microsoft Windows operating system that can produce
a printed image or text on paper or other medium.

.DESCRIPTION

Gets the information about a device connected to a computer
running on a Microsoft Windows operating system that can produce
a printed image or text on paper or other medium and converts
all codes in results into human readable format.

.PARAMETER ComputerName

Specifies the computer names or IP Addresses of the systems that
we want to get the information from.

.INPUTS

System.Array. Get-PrinterInfo can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PrinterInfo returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PrinterInfo

.EXAMPLE

PS C:\> Get-PrinterInfo -ComputerName Server1

.EXAMPLE

PS C:\> Get-PrinterInfo -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-PrinterInfo -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-PrinterInfo -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-PrinterInfo -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-PrinterInfo -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-PrinterInfo

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-PrinterInfo

.EXAMPLE

PS C:\> "Server1" | Get-PrinterInfo

.EXAMPLE

PS C:\> "192.168.0.5" | Get-PrinterInfo

.LINK

https://www.sconstantinou.com/get-printerinfo
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_Printer).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $PrinterInfo = Get-CimInstance -ClassName Win32_Printer -Property $Properties | Select-Object $Properties
    }
    else{

        $PrinterInfo = Get-CimInstance -ClassName Win32_Printer -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PrinterInfo){

        $MaxSizeSupported = $_.MaxSizeSupported * 1KB

        switch ($MaxSizeSupported){
            {$MaxSizeSupported -ge 1MB}
                {
                    $PrinterInfo | Add-Member -MemberType NoteProperty -Name "MaxSizeSupportedMB" -Value "" -Force
                }
            {$MaxSizeSupported -ge 1GB}
                {
                    $PrinterInfo | Add-Member -MemberType NoteProperty -Name "MaxSizeSupportedGB" -Value "" -Force
                }
        }
    }

    foreach ($_ in $PrinterInfo){

        $_.Attributes = Get-AttributesCode ($_.Attributes)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CurrentCapabilities = Get-CurrentCapabilitiesCode ($_.CurrentCapabilities)
        $_.CurrentLanguage = Get-CurrentLanguage ($_.CurrentLanguage)
        $_.DefaultCapabilities = Get-DefaultCapabilitiesCode ($_.DefaultCapabilities)
        $_.DefaultLanguage = Get-DefaultLanguage ($_.DefaultLanguage)
        $_.DetectedErrorState = Get-DetectedErrorState ($_.DetectedErrorState)
        $_.ExtendedDetectedErrorState = Get-ExtendedDetectedErrorState ($_.ExtendedDetectedErrorState)
        $_.ExtendedPrinterStatus = Get-ExtendedPrinterStatus ($_.ExtendedPrinterStatus)
        $_.LanguagesSupported = Get-LanguagesSupported ($_.LanguagesSupported)
        $_.MarkingTechnology = Get-MarkingTechnology ($_.MarkingTechnology)
        $_.PaperSizesSupported = Get-PaperSizesSupported ($_.PaperSizesSupported)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode ($_.PowerManagementCapabilities)
        $_.PrinterState = Get-PrinterState ($_.PrinterState)
        $_.PrinterStatus = Get-PrinterStatus ($_.PrinterStatus)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
        if ($_.PSObject.Properties.Name -match "MaxSizeSupportedMB"){$_.MaxSizeSupportedMB = Get-SizeMB ($_.MaxSizeSupported)}
        if ($_.PSObject.Properties.Name -match "MaxSizeSupportedGB"){$_.MaxSizeSupportedGB = Get-SizeGB ($_.MaxSizeSupported)}
    }

    Write-Output $PrinterInfo
}