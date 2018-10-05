function Get-OnBoardDevice {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_OnBoardDevice).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $OnBoardDevice = Get-CimInstance -ClassName Win32_OnBoardDevice -Property $Properties | Select-Object $Properties
    }
    else{

        $OnBoardDevice = Get-CimInstance -ClassName Win32_OnBoardDevice -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $OnBoardDevice){

        $_.DeviceType = Get-DeviceType ($_.DeviceType)
    }
    
    Write-Output $OnBoardDevice
}