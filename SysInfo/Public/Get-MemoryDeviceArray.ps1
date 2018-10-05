Function Get-MemoryDeviceArray {

    [cmdletbinding()]

    param (
    [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_MemoryDeviceArray).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $MemoryDeviceArray = Get-CimInstance -ClassName Win32_MemoryDeviceArray -Property $Properties | Select-Object $Properties
    }
    else {

        $MemoryDeviceArray = Get-CimInstance -ClassName Win32_MemoryDeviceArray -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    Write-Output $MemoryDeviceArray
}