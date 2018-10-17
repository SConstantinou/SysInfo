function Get-PrinterConfiguration {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PrinterConfiguration).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PrinterConfiguration = Get-CimInstance -ClassName Win32_PrinterConfiguration -Property $Properties | Select-Object $Properties
    }
    else{

        $PrinterConfiguration = Get-CimInstance -ClassName Win32_PrinterConfiguration -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PrinterConfiguration){

        $_.Color = Get-Color ($_.Color)
        $_.DitherType = Get-DitherType ($_.DitherType)
        $_.ICMIntent = Get-ICMIntent ($_.ICMIntent)
        $_.ICMMethod = Get-ICMMethod ($_.ICMMethod)
        $_.MediaType = Get-PrinterMediaType ($_.MediaType)
        $_.Orientation = Get-Orientation ($_.Orientation)
        $_.PrintQuality = Get-PrintQuality ($_.PrintQuality)
        $_.TTOption = Get-TTOption ($_.TTOption)
    }

    Write-Output $PrinterConfiguration
}