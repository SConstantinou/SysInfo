function Get-VideoController {

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
            {$AdapterRAM -gt 1KB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMKB" -Value "" -Force
                }
            {$AdapterRAM -gt 1MB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMMB" -Value "" -Force
                }
            {$AdapterRAM -gt 1GB}
                {
                    $VideoController | Add-Member -MemberType NoteProperty -Name "AdapterRAMGB" -Value "" -Force
                }
        }

    }
    
    foreach ($_ in $VideoController){

        $_.AcceleratorCapabilities = Get-AcceleratorCapabilities ($_.AcceleratorCapabilities)
        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.CurrentScanMode = Get-CurrentScanMode ($_.CurrentScanMode)
        $_.DitherType = Get-DitherType ($_.DitherType)
        $_.ICMIntent = Get-ICMIntent ($_.ICMIntent)
        $_.ICMMethod = Get-ICMMethod ($_.ICMMethod)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
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