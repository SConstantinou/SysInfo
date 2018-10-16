function Get-ImplementedCategory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ImplementedCategory).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ImplementedCategory = Get-CimInstance -ClassName Win32_ImplementedCategory -Property $Properties | Select-Object $Properties
    }
    else{

        $ImplementedCategory = Get-CimInstance -ClassName Win32_ImplementedCategory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $ImplementedCategory
}