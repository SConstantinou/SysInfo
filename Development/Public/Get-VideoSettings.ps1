function Get-VideoSettings {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_VideoSettings).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $VideoSettings = Get-CimInstance -ClassName Win32_VideoSettings -Property $Properties | Select-Object $Properties
    }
    else{

        $VideoSettings = Get-CimInstance -ClassName Win32_VideoSettings -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $VideoSettings
}