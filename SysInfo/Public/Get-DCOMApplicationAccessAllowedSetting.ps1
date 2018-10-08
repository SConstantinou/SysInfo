function Get-DCOMApplicationAccessAllowedSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DCOMApplicationAccessAllowedSetting ).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DCOMApplicationAccessAllowedSetting = Get-CimInstance -ClassName Win32_DCOMApplicationAccessAllowedSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $DCOMApplicationAccessAllowedSetting = Get-CimInstance -ClassName Win32_DCOMApplicationAccessAllowedSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DCOMApplicationAccessAllowedSetting 
}