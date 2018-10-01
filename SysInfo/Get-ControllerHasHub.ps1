function Get-ControllerHasHub {

    $Properties = ((Get-CimClass -ClassName Win32_ControllerHasHub).CimClassProperties).Name

    $ControllerHasHub = Get-CimInstance -ClassName Win32_ControllerHasHub -Property $Properties | Select-Object $Properties

    foreach ($_ in $ControllerHasHub){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $ControllerHasHub
}