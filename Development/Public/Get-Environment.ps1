function Get-Environment {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Environment).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Environment = Get-CimInstance -ClassName Win32_Environment -Property $Properties | Select-Object $Properties
    }
    else{

        $Environment = Get-CimInstance -ClassName Win32_Environment -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $Environment
}