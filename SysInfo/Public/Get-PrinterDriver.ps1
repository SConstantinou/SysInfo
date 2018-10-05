function Get-PrinterDriver {

    $Properties = ((Get-CimClass -ClassName Win32_PrinterDriver).CimClassProperties).Name

    $PrinterDriver = Get-CimInstance -ClassName Win32_PrinterDriver -Property $Properties | Select-Object $Properties
    
    Write-Output $PrinterDriver
}