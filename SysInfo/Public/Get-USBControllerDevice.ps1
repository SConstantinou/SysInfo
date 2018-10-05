function Get-USBControllerDevice {

    $Properties = ((Get-CimClass -ClassName Win32_USBControllerDevice).CimClassProperties).Name

    $USBControllerDevice = Get-CimInstance -ClassName Win32_USBControllerDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $USBControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $SerialPort
}