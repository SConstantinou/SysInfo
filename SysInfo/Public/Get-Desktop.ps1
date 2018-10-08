function Get-Desktop {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Desktop).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Desktop = Get-CimInstance -ClassName Win32_Desktop -Property $Properties | Select-Object $Properties
    }
    else{

        $Desktop = Get-CimInstance -ClassName Win32_Desktop -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $Desktop
}