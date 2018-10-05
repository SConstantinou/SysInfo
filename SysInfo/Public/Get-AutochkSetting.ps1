function Get-AutochkSetting {

    [cmdletbinding()]

    param (
    [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    
    $Properties = ((Get-CimClass -ClassName Win32_AutochkSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $AutochkSetting = Get-CimInstance -ClassName Win32_AutochkSetting -Property $Properties |
            Select-Object $Properties
    }
    else{

        $AutochkSetting = Get-CimInstance -ClassName Win32_AutochkSetting -Property $Properties -ComputerName $ComputerName |
            Select-Object $Properties
    }
    
    Write-Output $AutochkSetting
}