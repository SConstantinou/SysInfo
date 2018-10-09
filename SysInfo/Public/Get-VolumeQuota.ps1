function Get-VolumeQuota {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_VolumeQuota).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $VolumeQuota = Get-CimInstance -ClassName Win32_VolumeQuota -Property $Properties | Select-Object $Properties
    }
    else{

        $VolumeQuota = Get-CimInstance -ClassName Win32_VolumeQuota -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $VolumeQuota
}