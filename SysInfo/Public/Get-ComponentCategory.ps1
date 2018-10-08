function Get-ComponentCategory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ComponentCategory).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ComponentCategory = Get-CimInstance -ClassName Win32_ComponentCategory -Property $Properties | Select-Object $Properties
    }
    else{

        $ComponentCategory = Get-CimInstance -ClassName Win32_ComponentCategory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $ComponentCategory
}