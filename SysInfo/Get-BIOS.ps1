function Get-BIOS {

    $Properties = ((Get-CimClass -ClassName Win32_BIOS).CimClassProperties).Name

    $BIOS = Get-CimInstance -ClassName Win32_BIOS -Property $Properties | Select-Object $Properties

    foreach ($_ in $BIOS){

        $_.BiosCharacteristics = Get-BiosCharacteristics ($_.BiosCharacteristics)
        $_.SoftwareElementState = Get-SoftwareElementState ($_.SoftwareElementState)
        $_.TargetOperatingSystem = Get-TargetOperatingSystem ($_.TargetOperatingSystem)
    }
    
    Write-Output $BIOS
}