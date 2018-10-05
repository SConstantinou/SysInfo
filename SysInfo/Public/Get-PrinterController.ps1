function Get-PrinterController {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PrinterController).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PrinterController = Get-CimInstance -ClassName Win32_PrinterController -Property $Properties | Select-Object $Properties
    }
    else{

        $PrinterController = Get-CimInstance -ClassName Win32_PrinterController -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PrinterController){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $PrinterController
}