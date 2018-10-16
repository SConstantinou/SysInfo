function Get-NetworkAdapterConfiguration {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_NetworkAdapterConfiguration).CimClassProperties).Name
    $RemoveProperties = @("DatabasePath")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $NetworkAdapterConfiguration = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Property $Properties | Select-Object $Properties
    }
    else{

        $NetworkAdapterConfiguration = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $NetworkAdapterConfiguration){

        $_.IGMPLevel = Get-IGMPLevel ($_.IGMPLevel)
        $_.IPXFrameType = Get-IPXFrameType ($_.IPXFrameType)
        $_.IPXMediaType = Get-IPXMediaType ($_.IPXMediaType)
        $_.TcpipNetbiosOptions = Get-TcpipNetbiosOption ($_.TcpipNetbiosOptions)
    }

    Write-Output $NetworkAdapterConfiguration
}