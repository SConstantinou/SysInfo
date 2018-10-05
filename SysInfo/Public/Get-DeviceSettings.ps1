function Get-DeviceSettings {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DeviceSettings).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DeviceSettings = Get-CimInstance -ClassName Win32_DeviceSettings -Property $Properties | Select-Object $Properties
    }
    else{

        $DeviceSettings = Get-CimInstance -ClassName Win32_DeviceSettings -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DeviceSettings
}