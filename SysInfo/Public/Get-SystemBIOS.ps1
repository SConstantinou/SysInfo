function Get-SystemBIOS {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SystemBIOS).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SystemBIOS = Get-CimInstance -ClassName Win32_SystemBIOS -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemBIOS = Get-CimInstance -ClassName Win32_SystemBIOS -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $SystemBIOS
}