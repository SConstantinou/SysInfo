function Get-SerialPortSetting {

    $Properties = ((Get-CimClass -ClassName Win32_SerialPortSetting).CimClassProperties).Name

    $SerialPortSetting = Get-CimInstance -ClassName Win32_SerialPortSetting -Property $Properties | Select-Object $Properties
    
    Write-Output $SerialPortSetting
}