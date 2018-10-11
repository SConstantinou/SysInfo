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

    $OperatingSystem.DataExecutionPrevention_SupportPolicy = Get-DataExecutionPreventionSupportPolicy ($OperatingSystem.DataExecutionPrevention_SupportPolicy)
    $OperatingSystem.ForegroundApplicationBoost = Get-ForegroundApplicationBoost ($OperatingSystem.ForegroundApplicationBoost)

    if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryMB"){
            
        $OperatingSystem.FreePhysicalMemoryMB = Get-SizeMB ($OperatingSystem.FreePhysicalMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryGB"){
            
        $OperatingSystem.FreePhysicalMemoryGB = Get-SizeGB ($OperatingSystem.FreePhysicalMemory * 1KB)
    }

    if ($OperatingSystem.PSObject.Properties.Name -match "FreePhysicalMemoryTB"){
            
        $OperatingSystem.FreePhysicalMemoryTB = Get-SizeTB ($OperatingSystem.FreePhysicalMemory * 1KB)
    }
    
    Write-Output $OperatingSystem
}