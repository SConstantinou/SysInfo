function Get-TCPIPPrinterPort {

    $Properties = ((Get-CimClass -ClassName Win32_TCPIPPrinterPort).CimClassProperties).Name

    $TCPIPPrinterPort = Get-CimInstance -ClassName Win32_TCPIPPrinterPort -Property $Properties | Select-Object $Properties

    foreach ($_ in $TCPIPPrinterPort){

        $_.Protocol = Get-Protocol ($_.Protocol)
    }
    
    Write-Output $TCPIPPrinterPort
}