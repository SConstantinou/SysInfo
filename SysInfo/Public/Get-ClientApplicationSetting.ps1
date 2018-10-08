function Get-ClientApplicationSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ClientApplicationSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ClientApplicationSetting = Get-CimInstance -ClassName Win32_ClientApplicationSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $ClientApplicationSetting = Get-CimInstance -ClassName Win32_ClientApplicationSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $ClientApplicationSetting
}