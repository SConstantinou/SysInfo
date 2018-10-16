function Get-COMSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_COMSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $COMSetting = Get-CimInstance -ClassName Win32_COMSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $COMSetting = Get-CimInstance -ClassName Win32_COMSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $COMSetting
}