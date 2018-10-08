function Get-ComClassAutoEmulator {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ComClassAutoEmulator).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ComClassAutoEmulator = Get-CimInstance -ClassName Win32_ComClassAutoEmulator -Property $Properties | Select-Object $Properties
    }
    else{

        $ComClassAutoEmulator = Get-CimInstance -ClassName Win32_ComClassAutoEmulator -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $ComClassAutoEmulator
}