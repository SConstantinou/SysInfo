function Get-PrinterSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PrinterSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PrinterSetting = Get-CimInstance -ClassName Win32_PrinterSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $PrinterSetting = Get-CimInstance -ClassName Win32_PrinterSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $PrinterSetting
}