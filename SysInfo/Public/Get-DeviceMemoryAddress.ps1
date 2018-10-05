function Get-DeviceMemoryAddress {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DeviceMemoryAddress).CimClassProperties).Name

    if ($ComputerName -eq ''){
    
        $DeviceMemoryAddress = Get-CimInstance -ClassName Win32_DeviceMemoryAddress -Property $Properties | Select-Object $Properties
    }
    else{

        $DeviceMemoryAddress = Get-CimInstance -ClassName Win32_DeviceMemoryAddress -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DeviceMemoryAddress
}