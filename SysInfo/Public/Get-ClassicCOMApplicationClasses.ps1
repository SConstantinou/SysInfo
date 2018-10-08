function Get-ClassicCOMApplicationClasses {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ClassicCOMApplicationClasses).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ClassicCOMApplicationClasses = Get-CimInstance -ClassName Win32_ClassicCOMApplicationClasses -Property $Properties | Select-Object $Properties
    }
    else{

        $ClassicCOMApplicationClasses = Get-CimInstance -ClassName Win32_ClassicCOMApplicationClasses -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $ClassicCOMApplicationClasses
}