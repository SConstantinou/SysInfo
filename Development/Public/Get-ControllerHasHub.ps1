function Get-ControllerHasHub {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_ControllerHasHub).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

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