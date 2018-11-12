function Get-OperatingSystem {
<#
.SYNOPSIS

Gets the information about a Windows-based operating system
installed on a computer.

.DESCRIPTION

Gets the information about a Windows-based operating system
installed on a computer and converts all codes in results
into human readable format.

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

System.Array. Get-OperatingSystem can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-OperatingSystem returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-OperatingSystem

This commnand gets the information from local system

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName "192.168.0.5"

This commnand gets the information from remoted system with IP 192.168.0.5

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1,Server2,Server3

This commnand gets the information from Server1, Server2 and Server3

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1 -Properties Name,Status

This commnand gets the information from Server1 and will output only Name
and Status Properties

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1 -Properties *

This commnand gets the information from Server1 and will output all properties

.EXAMPLE

PS C:\> "Server1" | Get-OperatingSystem

This commnand gets the information from Server1

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1 -Protocol DCOM

This commnand gets the information from Server1 using DCOM protocol

.LINK

https://www.sconstantinou.com/get-operatingsystem
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol,
        [alias("Property")][String[]]$Properties)

    $ClassName = 'Win32_OperatingSystem'
    [System.Collections.ArrayList]$DefaultProperties = 'SystemDirectory','Organization','BuildNumber','RegisteredUser','SerialNumber','Version','SystemName'

    [System.Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","CSCreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$AllProperties.Remove($_)}

    $OperatingSystem = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $AllProperties

    Foreach ($_ in $OperatingSystem){

        [uint64]$FreePhysicalMemory = $_.FreePhysicalMemory * 1KB
        [uint64]$FreeSpaceInPagingFiles = $_.FreeSpaceInPagingFiles * 1KB
        [uint64]$FreeVirtualMemory = $_.FreeVirtualMemory * 1KB
        [uint64]$MaxProcessMemorySize = $_.MaxProcessMemorySize * 1KB
        [uint64]$SizeStoredInPagingFiles = $_.SizeStoredInPagingFiles * 1KB
        [uint64]$TotalVirtualMemorySize = $_.TotalVirtualMemorySize * 1KB
        [uint64]$TotalVisibleMemorySize = $_.TotalVisibleMemorySize * 1KB

        switch ($FreePhysicalMemory){
            {$FreePhysicalMemory -ge 1MB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreePhysicalMemoryMB" -Value "" -Force
                }
            {$FreePhysicalMemory -ge 1GB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreePhysicalMemoryGB" -Value "" -Force
                }
            {$FreePhysicalMemory -ge 1TB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreePhysicalMemoryTB" -Value "" -Force
                }
        }

        switch ($FreeSpaceInPagingFiles){
            {$FreeSpaceInPagingFiles -ge 1MB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeSpaceInPagingFilesMB" -Value "" -Force
                }
            {$FreeSpaceInPagingFiles -ge 1GB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeSpaceInPagingFilesGB" -Value "" -Force
                }
            {$FreeSpaceInPagingFiles -ge 1TB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeSpaceInPagingFilesTB" -Value "" -Force
                }
        }

        switch ($FreeVirtualMemory){
            {$FreeVirtualMemory -ge 1MB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeVirtualMemoryMB" -Value "" -Force
                }
            {$FreeVirtualMemory -ge 1GB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeVirtualMemoryGB" -Value "" -Force
                }
            {$FreeVirtualMemory -ge 1TB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeVirtualMemoryTB" -Value "" -Force
                }
        }

        switch ($MaxProcessMemorySize){
            {$MaxProcessMemorySize -ge 1MB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "MaxProcessMemorySizeMB" -Value "" -Force
                }
            {$MaxProcessMemorySize -ge 1GB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "MaxProcessMemorySizeGB" -Value "" -Force
                }
            {$MaxProcessMemorySize -ge 1TB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "MaxProcessMemorySizeTB" -Value "" -Force
                }
        }

        switch ($SizeStoredInPagingFiles){
            {$SizeStoredInPagingFiles -ge 1MB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "SizeStoredInPagingFilesMB" -Value "" -Force
                }
            {$SizeStoredInPagingFiles -ge 1GB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "SizeStoredInPagingFilesGB" -Value "" -Force
                }
        }

        switch ($TotalVirtualMemorySize){
            {$TotalVirtualMemorySize -ge 1MB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "TotalVirtualMemorySizeMB" -Value "" -Force
                }
            {$TotalVirtualMemorySize -ge 1GB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "TotalVirtualMemorySizeGB" -Value "" -Force
                }
            {$TotalVirtualMemorySize -ge 1TB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "TotalVirtualMemorySizeTB" -Value "" -Force
                }
        }

        switch ($TotalVisibleMemorySize){
            {$TotalVisibleMemorySize -ge 1MB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "TotalVisibleMemorySizeMB" -Value "" -Force
                }
            {$TotalVisibleMemorySize -ge 1GB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "TotalVisibleMemorySizeGB" -Value "" -Force
                }
            {$TotalVisibleMemorySize -ge 1TB}
                {
                    $OperatingSystem | Add-Member -MemberType NoteProperty -Name "TotalVisibleMemorySizeTB" -Value "" -Force
                }
        }
    }

    foreach ($_ in $OperatingSystem){

        $_.DataExecutionPrevention_SupportPolicy = Get-DataExecutionPreventionSupportPolicy ($_.DataExecutionPrevention_SupportPolicy)
        $_.ForegroundApplicationBoost = Get-ForegroundApplicationBoost ($_.ForegroundApplicationBoost)
        $_.Locale = Get-Locale ($_.Locale)
        $_.LargeSystemCache = Get-LargeSystemCache ($_.LargeSystemCache)
        $_.OperatingSystemSKU = Get-OperatingSystemSKU ($_.OperatingSystemSKU)
        $_.OSLanguage = Get-OSLanguage ($_.OSLanguage)
        $_.OSProductSuite = Get-OSProductSuite ($_.OSProductSuite)
        $_.OSType = Get-OSType ($_.OSType)
        $_.ProductType = Get-ProductType ($_.ProductType)

        if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryMB"){

            $_.FreePhysicalMemoryMB = Get-SizeMB ($_.FreePhysicalMemory * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryGB"){

            $_.FreePhysicalMemoryGB = Get-SizeGB ($_.FreePhysicalMemory * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryTB"){

            $_.FreePhysicalMemoryTB = Get-SizeTB ($_.FreePhysicalMemory * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreeSpaceInPagingFilesMB"){

            $_.FreeSpaceInPagingFilesMB = Get-SizeMB ($_.FreeSpaceInPagingFiles * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreeSpaceInPagingFilesGB"){

            $_.FreeSpaceInPagingFilesGB = Get-SizeGB ($_.FreeSpaceInPagingFiles * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreeSpaceInPagingFilesTB"){

            $_.FreeSpaceInPagingFilesTB = Get-SizeTB ($_.FreeSpaceInPagingFiles * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreeVirtualMemoryMB"){

            $_.FreeVirtualMemoryMB = Get-SizeMB ($_.FreeVirtualMemory * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreeVirtualMemoryGB"){

            $_.FreeVirtualMemoryGB = Get-SizeGB ($_.FreeVirtualMemory * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "FreeVirtualMemoryTB"){

            $_.FreeVirtualMemoryTB = Get-SizeTB ($_.FreeVirtualMemory * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "MaxProcessMemorySizeMB"){

            $_.MaxProcessMemorySizeMB = Get-SizeMB ($_.MaxProcessMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "MaxProcessMemorySizeGB"){

            $_.MaxProcessMemorySizeGB = Get-SizeGB ($_.MaxProcessMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "MaxProcessMemorySizeTB"){

            $_.MaxProcessMemorySizeTB = Get-SizeTB ($_.MaxProcessMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "SizeStoredInPagingFilesMB"){

            $_.SizeStoredInPagingFilesMB = Get-SizeMB ($_.SizeStoredInPagingFiles * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "SizeStoredInPagingFilesGB"){

            $_.SizeStoredInPagingFilesGB = Get-SizeGB ($_.SizeStoredInPagingFiles * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "TotalVirtualMemorySizeMB"){

            $_.TotalVirtualMemorySizeMB = Get-SizeMB ($_.TotalVirtualMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "TotalVirtualMemorySizeGB"){

            $_.TotalVirtualMemorySizeGB = Get-SizeGB ($_.TotalVirtualMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "TotalVirtualMemorySizeTB"){

            $_.TotalVirtualMemorySizeTB = Get-SizeTB ($_.TotalVirtualMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "TotalVisibleMemorySizeMB"){

            $_.TotalVisibleMemorySizeMB = Get-SizeMB ($_.TotalVisibleMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "TotalVisibleMemorySizeGB"){

            $_.TotalVisibleMemorySizeGB = Get-SizeGB ($_.TotalVisibleMemorySize * 1KB)
        }

        if ($OperatingSystem.PSObject.Properties.Name -match "TotalVisibleMemorySizeTB"){

            $_.TotalVisibleMemorySizeTB = Get-SizeTB ($_.TotalVisibleMemorySize * 1KB)
        }
    }

    Optimize-Output -Object $OperatingSystem -Properties $Properties -DefaultProperties $DefaultProperties
}