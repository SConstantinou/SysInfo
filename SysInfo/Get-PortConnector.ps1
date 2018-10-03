function Get-PortConnector {

    $Properties = ((Get-CimClass -ClassName Win32_PortConnector).CimClassProperties).Name

    $PortConnector = Get-CimInstance -ClassName Win32_PortConnector -Property $Properties | Select-Object $Properties

    foreach ($_ in $PortConnector){

        $_.ConnectorType = Get-ConnectorType ($_.ConnectorType)
        $_.PortType = Get-PortType ($_.PortType)
    }
    
    Write-Output $PortConnector
}