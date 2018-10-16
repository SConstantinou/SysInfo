function Get-BIOS {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_BIOS).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $BIOS = Get-CimInstance -ClassName Win32_BIOS -Property $Properties | Select-Object $Properties
    }
    else{

        $BIOS = Get-CimInstance -ClassName Win32_BIOS -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $BIOS){

        $_.BiosCharacteristics = Get-BiosCharacteristicsCode ($_.BiosCharacteristics)
        $_.SoftwareElementState = Get-SoftwareElementState ($_.SoftwareElementState)
        $_.TargetOperatingSystem = Get-TargetOperatingSystem ($_.TargetOperatingSystem)
    }

    Write-Output $BIOS
}