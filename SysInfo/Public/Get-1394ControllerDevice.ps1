function Get-1394ControllerDevice {

    $Properties = ((Get-CimClass -ClassName Win32_1394ControllerDevice).CimClassProperties).Name

    $1394ControllerDevice = Get-CimInstance -ClassName Win32_1394ControllerDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $1394ControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $1394ControllerDevice
}