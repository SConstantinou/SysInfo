function Get-VolumeUserQuota {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_VolumeUserQuota).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $VolumeUserQuota = Get-CimInstance -ClassName Win32_VolumeUserQuota -Property $Properties | Select-Object $Properties
    }
    else{

        $VolumeUserQuota = Get-CimInstance -ClassName Win32_VolumeUserQuota -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $VolumeUserQuota){

        $_.Status = Get-Status ($_.Status)
    }
    
    Write-Output $VolumeUserQuota
}