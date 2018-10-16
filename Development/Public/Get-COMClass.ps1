function Get-COMClass {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_COMClass).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $COMClass = Get-CimInstance -ClassName Win32_COMClass -Property $Properties | Select-Object $Properties
    }
    else{

        $COMClass = Get-CimInstance -ClassName Win32_COMClass -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $COMClass
}