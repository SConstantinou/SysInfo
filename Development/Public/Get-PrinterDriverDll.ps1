function Get-PrinterDriverDll {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PrinterDriverDll).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PrinterDriverDll = Get-CimInstance -ClassName Win32_PrinterDriverDll -Property $Properties | Select-Object $Properties
    }
    else{

        $PrinterDriverDll = Get-CimInstance -ClassName Win32_PrinterDriverDll -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $PrinterDriverDll
}