function Get-PnPAllocatedResource {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PnPAllocatedResource).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PnPAllocatedResource = Get-CimInstance -ClassName Win32_PnPAllocatedResource -Property $Properties | Select-Object $Properties
    }
    else{

        $PnPAllocatedResource = Get-CimInstance -ClassName Win32_PnPAllocatedResource -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $PnPAllocatedResource
}