function Get-COMApplicationSettings {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_COMApplicationSettings).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $COMApplicationSettings = Get-CimInstance -ClassName Win32_COMApplicationSettings -Property $Properties | Select-Object $Properties
    }
    else{

        $COMApplicationSettings = Get-CimInstance -ClassName Win32_COMApplicationSettings -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $COMApplicationSettings
}