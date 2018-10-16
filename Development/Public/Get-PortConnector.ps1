function Get-PortConnector {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PortConnector).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PortConnector = Get-CimInstance -ClassName Win32_PortConnector -Property $Properties | Select-Object $Properties
    }
    else{

        $PortConnector = Get-CimInstance -ClassName Win32_PortConnector -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PortConnector){

        $_.ConnectorType = Get-ConnectorType ($_.ConnectorType)
        $_.PortType = Get-PortType ($_.PortType)
    }
    
    Write-Output $PortConnector
}