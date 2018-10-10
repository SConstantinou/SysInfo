function Get-AssociatedProcessorMemory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_AssociatedProcessorMemory).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","SystemCreationClassName","DeviceID","PNPDeviceID")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $AssociatedProcessorMemory = Get-CimInstance -ClassName Win32_AssociatedProcessorMemory -Property $Properties | Select-Object $Properties
    }
    else{

        $AssociatedProcessorMemory = Get-CimInstance -ClassName Win32_AssociatedProcessorMemory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
    Write-Output $AssociatedProcessorMemory
}