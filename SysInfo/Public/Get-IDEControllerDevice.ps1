function Get-IDEControllerDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_IDEControllerDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){
    
        $IDEControllerDevice = Get-CimInstance -ClassName Win32_IDEControllerDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $IDEControllerDevice = Get-CimInstance -ClassName Win32_IDEControllerDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $IDEControllerDevice){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $IDEControllerDevice
}