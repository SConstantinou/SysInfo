function Get-SystemDriverPNPEntity {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SystemDriverPNPEntity).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SystemDriverPNPEntity = Get-CimInstance -ClassName Win32_SystemDriverPNPEntity -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemDriverPNPEntity = Get-CimInstance -ClassName Win32_SystemDriverPNPEntity -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $SystemDriverPNPEntity
}