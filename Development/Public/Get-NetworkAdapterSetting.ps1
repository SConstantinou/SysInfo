function Get-NetworkAdapterSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_NetworkAdapterSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $NetworkAdapterSetting = Get-CimInstance -ClassName Win32_NetworkAdapterSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $NetworkAdapterSetting = Get-CimInstance -ClassName Win32_NetworkAdapterSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $NetworkAdapterSetting
}