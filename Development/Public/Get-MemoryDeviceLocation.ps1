Function Get-MemoryDeviceLocation {

    [cmdletbinding()]

    param (
    [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_MemoryDeviceLocation).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $MemoryDeviceLocation = Get-CimInstance -ClassName Win32_MemoryDeviceLocation -Property $Properties | Select-Object $Properties
    }
    else {

        $MemoryDeviceLocation = Get-CimInstance -ClassName Win32_MemoryDeviceLocation -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    Write-Output $MemoryDeviceLocation
}