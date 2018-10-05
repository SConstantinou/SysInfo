function Get-SystemEnclosure {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_SystemEnclosure).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $SystemEnclosure = Get-CimInstance -ClassName Win32_SystemEnclosure -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemEnclosure = Get-CimInstance -ClassName Win32_SystemEnclosure -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SystemEnclosure){

        $_.ChassisTypes = Get-ChassisTypes ($_.ChassisTypes)
        $_.SecurityBreach = Get-SecurityBreach ($_.SecurityBreach)
        $_.SecurityStatus = Get-SecurityStatus ($_.SecurityStatus)
        $_.ServicePhilosophy = Get-ServicePhilosophy ($_.ServicePhilosophy)
    }
    
    Write-Output $SystemEnclosure
}