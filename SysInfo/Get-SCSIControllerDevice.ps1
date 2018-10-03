function Get-SCSIControllerDevice {

    $Properties = ((Get-CimClass -ClassName Win32_SCSIControllerDevice).CimClassProperties).Name

    $SCSIControllerDevice = Get-CimInstance -ClassName Win32_SCSIControllerDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $SCSIControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $SCSIControllerDevice
}