function Get-PnPDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PnPDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PnPDevice = Get-CimInstance -ClassName Win32_PnPDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $PnPDevice = Get-CimInstance -ClassName Win32_PnPDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $PnPDevice
}