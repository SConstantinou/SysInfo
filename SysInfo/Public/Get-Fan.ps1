function Get-Fan {
    
    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_Fan).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $Fan = Get-CimInstance -ClassName Win32_Fan -Property $Properties | Select-Object -Property $Properties
    }
    else{

        $Fan = Get-CimInstance -ClassName Win32_Fan -Property $Properties -ComputerName $ComputerName | Select-Object -Property $Properties
    }

    foreach ($_ in $Fan){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode ($_.ConfigManagerErrorCode)
        $_.PowerManagementCapabilities = Get-PowerManagementCapabilities ($_.PowerManagementCapabilities)
        $_.StatusInfo = Get-StatusInfo ($_.StatusInfo)
    }

    Write-Output $Fan
}