function Get-OperatingSystemAutochkSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_OperatingSystemAutochkSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $OperatingSystemAutochkSetting = Get-CimInstance -ClassName Win32_OperatingSystemAutochkSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $OperatingSystemAutochkSetting = Get-CimInstance -ClassName Win32_OperatingSystemAutochkSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $OperatingSystemAutochkSetting
}