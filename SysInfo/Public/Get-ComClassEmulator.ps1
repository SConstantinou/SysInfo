function Get-ComClassEmulator {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ComClassEmulator).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ComClassEmulator = Get-CimInstance -ClassName Win32_ComClassEmulator -Property $Properties | Select-Object $Properties
    }
    else{

        $ComClassEmulator = Get-CimInstance -ClassName Win32_ComClassEmulator -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $ComClassEmulator
}