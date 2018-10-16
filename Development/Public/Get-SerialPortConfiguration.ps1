function Get-SerialPortConfiguration {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SerialPortConfiguration).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SerialPortConfiguration = Get-CimInstance -ClassName Win32_SerialPortConfiguration -Property $Properties | Select-Object $Properties
    }
    else{

        $SerialPortConfiguration = Get-CimInstance -ClassName Win32_SerialPortConfiguration -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SerialPortConfiguration){

        $_.XOnXOffInFlowControl = Get-XOnXOffInFlowControl ($_.XOnXOffInFlowControl)
    }
    
    Write-Output $SerialPortConfiguration
}