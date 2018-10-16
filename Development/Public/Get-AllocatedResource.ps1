function Get-AllocatedResource {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_AllocatedResource).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $AllocatedResource = Get-CimInstance -ClassName Win32_AllocatedResource -Property $Properties | Select-Object $Properties
    }
    else{

        $AllocatedResource = Get-CimInstance -ClassName Win32_AllocatedResource -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $AllocatedResource
}