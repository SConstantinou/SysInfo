function Get-DCOMApplication {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DCOMApplication).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DCOMApplication = Get-CimInstance -ClassName Win32_DCOMApplication -Property $Properties | Select-Object $Properties
    }
    else{

        $DCOMApplication = Get-CimInstance -ClassName Win32_DCOMApplication -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $DCOMApplication
}