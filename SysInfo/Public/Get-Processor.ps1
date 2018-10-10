function Get-Processor {

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
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.ProcessorType = Get-ProcessorType ($_.ProcessorType)
        $_.UpgradeMethod = Get-UpgradeMethod ($_.UpgradeMethod)
        $_.VoltageCaps = Get-VoltageCaps ($_.VoltageCaps)
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