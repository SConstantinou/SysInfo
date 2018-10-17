function Get-SystemEnclosure {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_SystemEnclosure).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $SystemEnclosure = Get-CimInstance -ClassName Win32_SystemEnclosure -Property $Properties | Select-Object $Properties
    }
    else{

        $SystemEnclosure = Get-CimInstance -ClassName Win32_SystemEnclosure -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $SystemEnclosure){

        if ($null -ne $_.Depth){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "DepthCM" -Value "$(Get-LengthCM ($_.Depth))" -Force
        }

        if ($null -ne $_.Height){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "HeightCM" -Value "$(Get-LengthCM ($_.Height))" -Force
        }

        if ($null -ne $_.Width){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WidthCM" -Value "$(Get-LengthCM ($_.Width))" -Force
        }

        if ($null -ne $_.Weight){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WeightGr" -Value "$(Get-WeightGram ($_.Weight))" -Force
        }

        if (($_.PSObject.Properties.Name -match "WeightGr") -and ($BaseBoard.WeightGr -ge 1000)){
            $SystemEnclosure |
                Add-Member -MemberType NoteProperty -Name "WeightKg" -Value "$(Get-WeightKg ($_.Weight))" -Force
        }

        $_.ChassisTypes = Get-ChassisType ($_.ChassisTypes)
        $_.SecurityBreach = Get-SecurityBreach ($_.SecurityBreach)
        $_.SecurityStatus = Get-SecurityStatus ($_.SecurityStatus)
        $_.ServicePhilosophy = Get-ServicePhilosophy ($_.ServicePhilosophy)
    }

    Write-Output $SystemEnclosure
}