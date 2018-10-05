function Get-ControllerHasHub {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ControllerHasHub).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ControllerHasHub = Get-CimInstance -ClassName Win32_ControllerHasHub -Property $Properties | Select-Object $Properties
    }
    else{

        $ControllerHasHub = Get-CimInstance -ClassName Win32_ControllerHasHub -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $ControllerHasHub){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $ControllerHasHub
}