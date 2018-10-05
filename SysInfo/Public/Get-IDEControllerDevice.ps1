function Get-IDEControllerDevice {

    $Properties = ((Get-CimClass -ClassName Win32_IDEControllerDevice).CimClassProperties).Name

    $IDEControllerDevice = Get-CimInstance -ClassName Win32_IDEControllerDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $IDEControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $IDEControllerDevice
}