function Get-DCOMApplicationLaunchAllowedSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DCOMApplicationLaunchAllowedSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DCOMApplicationLaunchAllowedSetting = Get-CimInstance -ClassName Win32_DCOMApplicationLaunchAllowedSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $DCOMApplicationLaunchAllowedSetting = Get-CimInstance -ClassName Win32_DCOMApplicationLaunchAllowedSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DCOMApplicationLaunchAllowedSetting
}