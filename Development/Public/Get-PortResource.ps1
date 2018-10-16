function Get-PortResource {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PortResource).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PortResource = Get-CimInstance -ClassName Win32_PortResource -Property $Properties | Select-Object $Properties
    }
    else{

        $PortResource = Get-CimInstance -ClassName Win32_PortResource -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $PortResource
}