function Get-COMApplication {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_COMApplication).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $COMApplication = Get-CimInstance -ClassName Win32_COMApplication -Property $Properties | Select-Object $Properties
    }
    else{

        $COMApplication = Get-CimInstance -ClassName Win32_COMApplication -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $COMApplication
}