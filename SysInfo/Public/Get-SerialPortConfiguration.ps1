function Get-SerialPortConfiguration {

    $Properties = ((Get-CimClass -ClassName Win32_SerialPortConfiguration).CimClassProperties).Name

    $SerialPortConfiguration = Get-CimInstance -ClassName Win32_SerialPortConfiguration -Property $Properties | Select-Object $Properties

    foreach ($_ in $SerialPortConfiguration){

        $_.XOnXOffInFlowControl = Get-XOnXOffInFlowControl ($_.XOnXOffInFlowControl)
    }
    
    Write-Output $SerialPortConfiguration
}