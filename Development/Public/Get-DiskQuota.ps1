function Get-DiskQuota {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DiskQuota).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DiskQuota = Get-CimInstance -ClassName Win32_DiskQuota -Property $Properties | Select-Object $Properties
    }
    else{

        $DiskQuota = Get-CimInstance -ClassName Win32_DiskQuota -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DiskQuota){

        $_.Status = Get-DiskQuotaStatus ($_.Status)
    }
    
    Write-Output $DiskQuota
}