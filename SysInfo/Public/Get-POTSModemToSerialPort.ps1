function Get-POTSModemToSerialPort {

    $Properties = ((Get-CimClass -ClassName Win32_POTSModemToSerialPort).CimClassProperties).Name

    $POTSModemToSerialPort = Get-CimInstance -ClassName Win32_POTSModemToSerialPort -Property $Properties | Select-Object $Properties

    foreach ($_ in $POTSModemToSerialPort){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $POTSModemToSerialPort
}