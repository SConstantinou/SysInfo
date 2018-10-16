function Get-VolumeQuotaSetting {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_VolumeQuotaSetting).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $VolumeQuotaSetting = Get-CimInstance -ClassName Win32_VolumeQuotaSetting -Property $Properties | Select-Object $Properties
    }
    else{

        $VolumeQuotaSetting = Get-CimInstance -ClassName Win32_VolumeQuotaSetting -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $VolumeQuotaSetting
}