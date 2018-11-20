function Get-PrinterSysInfo {
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

.PARAMETER Protocol

Specifies the protocol that will be used to get the information
from the remote system.

.PARAMETER Properties

Specifies the object properties that appear in the display and
the order in which they appear. Wildcards are permitted.

.INPUTS

System.Array. Get-PrinterSysInfo can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-PrinterSysInfo returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-PrinterSysInfo

This command gets the information from local system

.EXAMPLE

PS C:\> Get-PrinterSysInfo -ComputerName Server1

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-PrinterSysInfo -ComputerName "192.168.0.5"

This command gets the information from remote system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-PrinterSysInfo -ComputerName Server1,Server2,Server3

This command gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Properties Name,Status

This command gets the information from Server1 and will output only Name
and Status Properties.

.EXAMPLE

PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Properties *

This command gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-PrinterSysInfo

This command gets the information from Server1

.EXAMPLE

PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Protocol DCOM

This command gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/Get-PrinterSysInfo
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [SupportsWildcards()][alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_Printer'
    [System.Collections.ArrayList]$DefaultProperties = 'Name','ShareName','PrinterState','PrinterStatus','Location','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $PrinterInfo = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

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

    Optimize-Output -Object $PrinterInfo -Properties $Properties -DefaultProperties $DefaultProperties
}