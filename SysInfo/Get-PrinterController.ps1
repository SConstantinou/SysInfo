function Get-PrinterController {

    $Properties = ((Get-CimClass -ClassName Win32_PrinterController).CimClassProperties).Name

    $PrinterController = Get-CimInstance -ClassName Win32_PrinterController -Property $Properties | Select-Object $Properties

    foreach ($_ in $PrinterController){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $PrinterController
}