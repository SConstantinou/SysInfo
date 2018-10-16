function Get-ClassicCOMClassSettings {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_ClassicCOMClassSettings).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $ClassicCOMClassSettings = Get-CimInstance -ClassName Win32_ClassicCOMClassSettings -Property $Properties | Select-Object $Properties
    }
    else{

        $ClassicCOMClassSettings = Get-CimInstance -ClassName Win32_ClassicCOMClassSettings -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $ClassicCOMClassSettings
}