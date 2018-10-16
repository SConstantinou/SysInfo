function Get-PhysicalMemory {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_PhysicalMemory).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $PhysicalMemory = Get-CimInstance -ClassName Win32_PhysicalMemory -Property $Properties | Select-Object $Properties
    }
    else{

        $PhysicalMemory = Get-CimInstance -ClassName Win32_PhysicalMemory -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PhysicalMemory){

        [uint64]$Capacity = $_.Capacity

        switch ($Capacity){
            {$Capacity -gt 1KB}
                {
                    $PhysicalMemory | Add-Member -MemberType NoteProperty -Name "CapacityKB" -Value "" -Force
                }
            {$Capacity -gt 1MB}
                {
                    $PhysicalMemory | Add-Member -MemberType NoteProperty -Name "CapacityMB" -Value "" -Force
                }
            {$Capacity -gt 1GB}
                {
                    $PhysicalMemory | Add-Member -MemberType NoteProperty -Name "CapacityGB" -Value "" -Force
                }
        }

    }

    foreach ($_ in $PhysicalMemory){

        $_.FormFactor = Get-FormFactor ($_.FormFactor)
        $_.InterleavePosition = Get-InterleavePosition ($_.InterleavePosition)
        $_.MemoryType = Get-MemoryType ($_.MemoryType)
        $_.TypeDetail = Get-TypeDetail ($_.TypeDetail)
        if ($_.PSObject.Properties.Name -match "CapacityKB"){$_.CapacityKB = Get-SizeKB ($_.Capacity)}
        if ($_.PSObject.Properties.Name -match "CapacityMB"){$_.CapacityMB = Get-SizeMB ($_.Capacity)}
        if ($_.PSObject.Properties.Name -match "CapacityGB"){$_.CapacityGB = Get-SizeGB ($_.Capacity)}
    }
    
    Write-Output $PhysicalMemory
}