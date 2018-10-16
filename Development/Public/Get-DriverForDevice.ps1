function Get-DriverForDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DriverForDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DriverForDevice = Get-CimInstance -ClassName Win32_DriverForDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $DriverForDevice = Get-CimInstance -ClassName Win32_DriverForDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DriverForDevice
}