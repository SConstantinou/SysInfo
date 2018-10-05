function Get-PrinterConfiguration {

    $Properties = ((Get-CimClass -ClassName Win32_PrinterConfiguration).CimClassProperties).Name

    $PrinterConfiguration = Get-CimInstance -ClassName Win32_PrinterConfiguration -Property $Properties | Select-Object $Properties

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