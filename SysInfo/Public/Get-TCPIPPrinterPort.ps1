function Get-TCPIPPrinterPort {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_TCPIPPrinterPort).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $TCPIPPrinterPort = Get-CimInstance -ClassName Win32_TCPIPPrinterPort -Property $Properties | Select-Object $Properties
    }
    else{

        $TCPIPPrinterPort = Get-CimInstance -ClassName Win32_TCPIPPrinterPort -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $TCPIPPrinterPort){

        $_.Protocol = Get-Protocol ($_.Protocol)
    }
    
    Write-Output $TCPIPPrinterPort
}