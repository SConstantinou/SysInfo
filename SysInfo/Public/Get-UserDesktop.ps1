function Get-UserDesktop {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_UserDesktop).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $UserDesktop = Get-CimInstance -ClassName Win32_UserDesktop -Property $Properties | Select-Object $Properties
    }
    else{

        $UserDesktop = Get-CimInstance -ClassName Win32_UserDesktop -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $UserDesktop
}