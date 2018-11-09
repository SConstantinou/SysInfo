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

.INPUTS

System.Array. Get-OperatingSystem can accept a string value
to determine the ComputerName parameter.

.OUTPUTS

System.Object. Get-OperatingSystem returns an object containing
all the information that has been retrieved.

.EXAMPLE

PS C:\> Get-OperatingSystem

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName "192.168.0.5"

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1,Server2,Server3

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName "192.168.0.5","192.168.0.6","192.168.0.7"

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> Get-OperatingSystem -ComputerName $MyServers

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> Get-OperatingSystem -ComputerName $MyIPs

.EXAMPLE

PS C:\> $MyServers = Server1,Server2,Server3
PS C:\> $MyServers | Get-OperatingSystem

.EXAMPLE

PS C:\> $MyIPs = "192.168.0.5","192.168.0.6","192.168.0.7"
PS C:\> $MyIPs | Get-OperatingSystem

.EXAMPLE

PS C:\> "Server1" | Get-OperatingSystem

.EXAMPLE

PS C:\> "192.168.0.5" | Get-OperatingSystem

.EXAMPLE

PS C:\> Get-OperatingSystem -ComputerName Server1 -Protocol DCOM

.LINK

https://www.sconstantinou.com/get-operatingsystem
#>

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName,
        [alias("p")][validateset("WinRM","DCOM")][String]$Protocol)

    $ClassName = 'Win32_OperatingSystem'

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","CSCreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    $OperatingSystem = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Protocol $Protocol -Properties $Properties

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

    Write-Output $OperatingSystem
}