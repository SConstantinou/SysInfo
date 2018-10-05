function Get-Processor {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Processor).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Processor = Get-CimInstance -ClassName Win32_Processor -Property $Properties | Select-Object $Properties
    }
    else{

        $Processor = Get-CimInstance -ClassName Win32_Processor -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
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
    }
    
    Write-Output $Processor
}