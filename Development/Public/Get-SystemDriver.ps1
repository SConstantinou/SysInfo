function Get-SystemDriver {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SystemDriver).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SystemDriver = Get-CimInstance -ClassName Win32_SystemDriver -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemDriver = Get-CimInstance -ClassName Win32_SystemDriver -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $SystemDriver
}