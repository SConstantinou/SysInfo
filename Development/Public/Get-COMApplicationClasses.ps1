function Get-COMApplicationClasses {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_COMApplicationClasses).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $COMApplicationClasses = Get-CimInstance -ClassName Win32_COMApplicationClasses -Property $Properties | Select-Object $Properties
    }
    else{

        $COMApplicationClasses = Get-CimInstance -ClassName Win32_COMApplicationClasses -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $COMApplicationClasses
}