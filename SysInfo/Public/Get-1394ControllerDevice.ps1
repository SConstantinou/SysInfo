function Get-1394ControllerDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_1394ControllerDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $1394ControllerDevice = Get-CimInstance -ClassName Win32_1394ControllerDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $1394ControllerDevice = Get-CimInstance -ClassName Win32_1394ControllerDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $1394ControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $1394ControllerDevice
}