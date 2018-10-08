function Get-ClassicCOMClass {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ClassicCOMClass).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ClassicCOMClass = Get-CimInstance -ClassName Win32_ClassicCOMClass -Property $Properties | Select-Object $Properties
    }
    else{

        $ClassicCOMClass = Get-CimInstance -ClassName Win32_ClassicCOMClass -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    
    Write-Output $ClassicCOMClass
}