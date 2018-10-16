function Get-DisplayControllerConfiguration {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DisplayControllerConfiguration).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DisplayControllerConfiguration = Get-CimInstance -ClassName Win32_DisplayControllerConfiguration -Property $Properties | Select-Object $Properties
    }
    else{

        $DisplayControllerConfiguration = Get-CimInstance -ClassName Win32_DisplayControllerConfiguration -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DisplayControllerConfiguration
}