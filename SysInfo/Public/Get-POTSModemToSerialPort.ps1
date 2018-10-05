function Get-POTSModemToSerialPort {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_POTSModemToSerialPort).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $POTSModemToSerialPort = Get-CimInstance -ClassName Win32_POTSModemToSerialPort -Property $Properties | Select-Object $Properties
    }
    else{

        $POTSModemToSerialPort = Get-CimInstance -ClassName Win32_POTSModemToSerialPort -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $POTSModemToSerialPort){

        $_.AccessState = Get-AccessState ($_.AccessState)
    }
    
    Write-Output $POTSModemToSerialPort
}