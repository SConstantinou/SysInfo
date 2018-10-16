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

    foreach ($_ in $TimeZone){

        $_.DaylightDayOfWeek = Get-DaylightDayOfWeek ($_.DaylightDayOfWeek)
        $_.DaylightMonth = Get-DaylightMonth ($_.DaylightMonth)
        $_.StandardDayOfWeek = Get-StandardDayOfWeek ($_.StandardDayOfWeek)
        $_.StandardMonth = Get-StandardMonth ($_.StandardMonth)
    }
    
    Write-Output $TimeZone
}