function Get-OnBoardDevice {

    $Properties = ((Get-CimClass -ClassName Win32_OnBoardDevice).CimClassProperties).Name

    $OnBoardDevice = Get-CimInstance -ClassName Win32_OnBoardDevice -Property $Properties | Select-Object $Properties

    foreach ($_ in $OnBoardDevice){

        $_.DeviceType = Get-DeviceType ($_.DeviceType)
    }
    
    Write-Output $OnBoardDevice
}