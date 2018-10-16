function Get-Directory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Directory).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Directory = Get-CimInstance -ClassName Win32_Directory -Property $Properties | Select-Object $Properties
    }
    else{

        $Directory = Get-CimInstance -ClassName Win32_Directory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $Directory){

        $_.AccessMask = Get-AccessMask ($_.AccessMask)
    }
    
    Write-Output $Directory
}