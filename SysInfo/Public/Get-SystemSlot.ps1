function Get-SystemSlot {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SystemSlot).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SystemSlot = Get-CimInstance -ClassName Win32_SystemSlot -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemSlot = Get-CimInstance -ClassName Win32_SystemSlot -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SystemSlot){

        $_.ConnectorType = Get-ConnectorType ($_.ConnectorType)
        $_.CurrentUsage = Get-CurrentUsage ($_.CurrentUsage)
        $_.MaxDataWidth = Get-MaxDataWidth ($_.MaxDataWidth)
        $_.VccMixedVoltageSupport = Get-VccMixedVoltageSupport ($_.VccMixedVoltageSupport)
        $_.VppMixedVoltageSupport = Get-VppMixedVoltageSupport ($_.VppMixedVoltageSupport)
    }
    
    Write-Output $SystemSlot
}