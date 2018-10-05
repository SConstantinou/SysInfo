function Get-NetworkAdapterConfiguration {

    $Properties = ((Get-CimClass -ClassName Win32_NetworkAdapterConfiguration).CimClassProperties).Name

    $NetworkAdapterConfiguration = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Property $Properties | Select-Object $Properties

    foreach ($_ in $NetworkAdapterConfiguration){

        $_.IGMPLevel = Get-IGMPLevel ($_.IGMPLevel)
        $_.IPXFrameType = Get-IPXFrameType ($_.IPXFrameType)
        $_.IPXMediaType = Get-IPXMediaType ($_.IPXMediaType)
        $_.TcpipNetbiosOptions = Get-TcpipNetbiosOptions ($_.TcpipNetbiosOptions)
    }
    
    Write-Output $NetworkAdapterConfiguration
}