function Get-OperatingSystem {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_OperatingSystem).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","CSCreationClassName","SystemCreationClassName","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $OperatingSystem = Get-CimInstance -ClassName Win32_OperatingSystem -Property $Properties | Select-Object $Properties
    }
    else{

        $OperatingSystem = Get-CimInstance -ClassName Win32_OperatingSystem -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    [uint64]$FreePhysicalMemory = $OperatingSystem.FreePhysicalMemory * 1KB
    [uint64]$FreeSpaceInPagingFiles = $OperatingSystem.FreeSpaceInPagingFiles * 1KB
    [uint64]$FreeVirtualMemory = $OperatingSystem.FreeVirtualMemory * 1KB
    [uint64]$MaxProcessMemorySize = $OperatingSystem.MaxProcessMemorySize * 1KB

    switch ($FreePhysicalMemory){
        {$FreePhysicalMemory -gt 1MB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreePhysicalMemoryMB" -Value "" -Force
            }
        {$FreePhysicalMemory -gt 1GB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreePhysicalMemoryGB" -Value "" -Force
            }
        {$FreePhysicalMemory -gt 1TB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreePhysicalMemoryTB" -Value "" -Force
            }
    }

    switch ($FreeSpaceInPagingFiles){
        {$FreeSpaceInPagingFiles -gt 1MB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeSpaceInPagingFilesMB" -Value "" -Force
            }
        {$FreeSpaceInPagingFiles -gt 1GB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeSpaceInPagingFilesGB" -Value "" -Force
            }
        {$FreeSpaceInPagingFiles -gt 1TB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeSpaceInPagingFilesTB" -Value "" -Force
            }
    }

    switch ($FreeVirtualMemory){
        {$FreeVirtualMemory -gt 1MB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeVirtualMemoryMB" -Value "" -Force
            }
        {$FreeVirtualMemory -gt 1GB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeVirtualMemoryGB" -Value "" -Force
            }
        {$FreeVirtualMemory -gt 1TB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "FreeVirtualMemoryTB" -Value "" -Force
            }
    }

    switch ($MaxProcessMemorySize){
        {$MaxProcessMemorySize -gt 1MB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "MaxProcessMemorySizeMB" -Value "" -Force
            }
        {$MaxProcessMemorySize -gt 1GB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "MaxProcessMemorySizeGB" -Value "" -Force
            }
        {$MaxProcessMemorySize -gt 1TB}
            {
                $OperatingSystem | Add-Member -MemberType NoteProperty -Name "MaxProcessMemorySizeTB" -Value "" -Force
            }
    }

    $OperatingSystem.DataExecutionPrevention_SupportPolicy = Get-DataExecutionPreventionSupportPolicy ($OperatingSystem.DataExecutionPrevention_SupportPolicy)
    $OperatingSystem.ForegroundApplicationBoost = Get-ForegroundApplicationBoost ($OperatingSystem.ForegroundApplicationBoost)
    $OperatingSystem.Locale = Get-Locale ($OperatingSystem.Locale)
    $OperatingSystem.LargeSystemCache = Get-LargeSystemCache ($OperatingSystem.LargeSystemCache)
    $OperatingSystem.OperatingSystemSKU = Get-OperatingSystemSKU ($OperatingSystem.OperatingSystemSKU)
    $OperatingSystem.OSLanguage = Get-OSLanguage ($OperatingSystem.OSLanguage)
    $OperatingSystem.OSProductSuite = Get-OSProductSuite ($OperatingSystem.OSProductSuite)
    $OperatingSystem.OSType = Get-OSType ($OperatingSystem.OSType)

    if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryMB"){
            
        $OperatingSystem.FreePhysicalMemoryMB = Get-SizeMB ($OperatingSystem.FreePhysicalMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryGB"){
            
        $OperatingSystem.FreePhysicalMemoryGB = Get-SizeGB ($OperatingSystem.FreePhysicalMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryTB"){
            
        $OperatingSystem.FreePhysicalMemoryTB = Get-SizeTB ($OperatingSystem.FreePhysicalMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreeSpaceInPagingFilesMB"){
            
        $OperatingSystem.FreeSpaceInPagingFilesMB = Get-SizeMB ($OperatingSystem.FreeSpaceInPagingFiles * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreeSpaceInPagingFilesGB"){
            
        $OperatingSystem.FreeSpaceInPagingFilesGB = Get-SizeGB ($OperatingSystem.FreeSpaceInPagingFiles * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreeSpaceInPagingFilesTB"){
            
        $OperatingSystem.FreeSpaceInPagingFilesTB = Get-SizeTB ($OperatingSystem.FreeSpaceInPagingFiles * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreeVirtualMemoryMB"){
            
        $OperatingSystem.FreeVirtualMemoryMB = Get-SizeMB ($OperatingSystem.FreeVirtualMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreeVirtualMemoryGB"){
            
        $OperatingSystem.FreeVirtualMemoryGB = Get-SizeGB ($OperatingSystem.FreeVirtualMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreeVirtualMemoryTB"){
            
        $OperatingSystem.FreeVirtualMemoryTB = Get-SizeTB ($OperatingSystem.FreeVirtualMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "MaxProcessMemorySizeMB"){
            
        $OperatingSystem.MaxProcessMemorySizeMB = Get-SizeMB ($OperatingSystem.MaxProcessMemorySize * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "MaxProcessMemorySizeGB"){
            
        $OperatingSystem.MaxProcessMemorySizeGB = Get-SizeGB ($OperatingSystem.MaxProcessMemorySize * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "MaxProcessMemorySizeTB"){
            
        $OperatingSystem.MaxProcessMemorySizeTB = Get-SizeTB ($OperatingSystem.MaxProcessMemorySize * 1KB)
    }
    
    Write-Output $OperatingSystem
}