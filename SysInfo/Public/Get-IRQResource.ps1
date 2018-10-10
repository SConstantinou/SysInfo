function Get-IRQResource {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_IRQResource).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","CSCreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $IRQResource = Get-CimInstance -ClassName Win32_IRQResource -Property $Properties | Select-Object $Properties
    }
    else{

        $IRQResource = Get-CimInstance -ClassName Win32_IRQResource -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $IRQResource){

        $_.Availability = Get-IRQAvailability ($_.Availability)
        $_.TriggerLevel = Get-TriggerLevel ($_.TriggerLevel)
        $_.TriggerType = Get-TriggerType ($_.TriggerType)
    }
    
    Write-Output $IRQResource
}