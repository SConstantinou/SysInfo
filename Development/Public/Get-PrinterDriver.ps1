function Get-PrinterDriver {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PrinterDriver).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PrinterDriver = Get-CimInstance -ClassName Win32_PrinterDriver -Property $Properties | Select-Object $Properties
    }
    else{

        $PrinterDriver = Get-CimInstance -ClassName Win32_PrinterDriver -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $PrinterDriver
}