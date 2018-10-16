function Get-DCOMApplicationSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DCOMApplicationSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DCOMApplicationSetting = Get-CimInstance -ClassName Win32_DCOMApplicationSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $DCOMApplicationSetting = Get-CimInstance -ClassName Win32_DCOMApplicationSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DCOMApplicationSetting){

        $_.AuthenticationLevel = Get-AuthenticationLevel ($_.AuthenticationLevel)
    }
    
    Write-Output $DCOMApplicationSetting
}