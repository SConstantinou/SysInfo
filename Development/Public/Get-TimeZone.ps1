function Get-TimeZone {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_TimeZone).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $TimeZone = Get-CimInstance -ClassName Win32_TimeZone -Property $Properties | Select-Object $Properties
    }
    else{

        $TimeZone = Get-CimInstance -ClassName Win32_TimeZone -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

        [String]$DaylightDayOfWeek = $TimeZone.DaylightDayOfWeek
        
        $TimeZone.DaylightDayOfWeek = Get-DaylightDayOfWeek $DaylightDayOfWeek
        $TimeZone.DaylightMonth = Get-DaylightMonth ($TimeZone.DaylightMonth)
        $TimeZone.StandardDayOfWeek = Get-StandardDayOfWeek ($TimeZone.StandardDayOfWeek)
        $TimeZone.StandardMonth = Get-StandardMonth ($TimeZone.StandardMonth)
        $TimeZone.DaylightDay = Get-DaylightDay ($TimeZone.DaylightDay) ($TimeZone.DaylightDayOfWeek) ($TimeZone.Month)
    Write-Output $TimeZone
}