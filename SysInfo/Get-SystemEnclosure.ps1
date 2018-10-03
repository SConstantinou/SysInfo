function Get-SystemEnclosure {

    $Properties = ((Get-CimClass -ClassName Win32_SystemEnclosure).CimClassProperties).Name

    $SystemEnclosure = Get-CimInstance -ClassName Win32_SystemEnclosure -Property $Properties | Select-Object $Properties

    foreach ($_ in $SystemEnclosure){

        $_.ChassisTypes = Get-ChassisTypes ($_.ChassisTypes)
        $_.SecurityBreach = Get-SecurityBreach ($_.SecurityBreach)
        $_.SecurityStatus = Get-SecurityStatus ($_.SecurityStatus)
        $_.ServicePhilosophy = Get-ServicePhilosophy ($_.ServicePhilosophy)
    }
    
    Write-Output $SystemEnclosure
}