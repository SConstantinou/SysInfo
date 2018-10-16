function Get-QuotaSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_QuotaSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $QuotaSetting = Get-CimInstance -ClassName Win32_QuotaSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $QuotaSetting = Get-CimInstance -ClassName Win32_QuotaSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $QuotaSetting){

        $_.State = Get-State ($_.State)
    }
    
    Write-Output $QuotaSetting
}