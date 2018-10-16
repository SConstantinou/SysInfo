function Get-SerialPortSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SerialPortSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SerialPortSetting = Get-CimInstance -ClassName Win32_SerialPortSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $SerialPortSetting = Get-CimInstance -ClassName Win32_SerialPortSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $SerialPortSetting
}