function Get-IRQResource {

    $Properties = ((Get-CimClass -ClassName Win32_IRQResource).CimClassProperties).Name

    $IRQResource = Get-CimInstance -ClassName Win32_IRQResource -Property $Properties | Select-Object $Properties

    foreach ($_ in $IRQResource){

        $_.Availability = Get-IRQAvailability ($_.Availability)
        $_.TriggerLevel = Get-TriggerLevel ($_.TriggerLevel)
        $_.TriggerType = Get-TriggerType ($_.TriggerType)
    }
    
    Write-Output $IRQResource
}