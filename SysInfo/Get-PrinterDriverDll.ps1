function Get-PrinterDriverDll {

    $Properties = ((Get-CimClass -ClassName Win32_PrinterDriverDll).CimClassProperties).Name

    $PrinterDriverDll = Get-CimInstance -ClassName Win32_PrinterDriverDll -Property $Properties | Select-Object $Properties
    
    Write-Output $PrinterDriverDll
}