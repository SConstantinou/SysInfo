function Get-SystemMemoryResource {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SystemMemoryResource).CimClassProperties).Name

    if ($ComputerName -eq ''){
    
        $SystemMemoryResource = Get-CimInstance -ClassName Win32_SystemMemoryResource -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemMemoryResource = Get-CimInstance -ClassName Win32_SystemMemoryResource -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $SystemMemoryResource
}