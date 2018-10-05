function Get-USBControllerDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_USBControllerDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $USBControllerDevice = Get-CimInstance -ClassName Win32_USBControllerDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $USBControllerDevice = Get-CimInstance -ClassName Win32_USBControllerDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $USBControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $SerialPort
}