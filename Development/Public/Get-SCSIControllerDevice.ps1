function Get-SCSIControllerDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SCSIControllerDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SCSIControllerDevice = Get-CimInstance -ClassName Win32_SCSIControllerDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $SCSIControllerDevice = Get-CimInstance -ClassName Win32_SCSIControllerDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SCSIControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $SCSIControllerDevice
}