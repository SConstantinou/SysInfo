function Get-PhysicalMemoryArray {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_PhysicalMemoryArray).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

    if ($ComputerName -eq ''){

        $PhysicalMemoryArray = Get-CimInstance -ClassName Win32_PhysicalMemoryArray -Property $Properties | Select-Object $Properties
    }
    else{

        $PhysicalMemoryArray = Get-CimInstance -ClassName Win32_PhysicalMemoryArray -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $PhysicalMemoryArray){

        [uint64]$MaxCapacity = $_.MaxCapacity * 1KB
        [uint64]$MaxCapacityEx = $_.MaxCapacityEx * 1KB

        switch ($MaxCapacity){
            {$MaxCapacity -gt 1MB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityMB" -Value "" -Force
                }
            {$MaxCapacity -gt 1GB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityGB" -Value "" -Force
                }
            {$MaxCapacity -gt 1TB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityTB" -Value "" -Force
                }
            {$MaxCapacity -gt 1PB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityPB" -Value "" -Force
                }
        }

        switch ($MaxCapacityEx){
            {$MaxCapacityEx -gt 1MB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExMB" -Value "" -Force
                }
            {$MaxCapacityEx -gt 1GB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExGB" -Value "" -Force
                }
            {$MaxCapacityEx -gt 1TB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExTB" -Value "" -Force
                }
            {$MaxCapacityEx -gt 1PB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExPB" -Value "" -Force
                }
        }
    }
    
    foreach ($_ in $PhysicalMemoryArray){

        $_.Location = Get-PhysicalMemoryArrayLocation ($_.Location)
        $_.MemoryErrorCorrection = Get-MemoryErrorCorrection ($_.MemoryErrorCorrection)
        $_.Use = Get-PhysicalMemoryArrayUse ($_.Use)
        if ($_.PSObject.Properties.Name -match "MaxCapacityMB"){$_.MaxCapacityMB = Get-SizeMB ($_.MaxCapacity * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxCapacityGB"){$_.MaxCapacityGB = Get-SizeGB ($_.MaxCapacity * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxCapacityTB"){$_.MaxCapacityTB = Get-SizeTB ($_.MaxCapacity * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxCapacityPB"){$_.MaxCapacityPB = Get-SizePB ($_.MaxCapacity * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxCapacityExMB"){$_.MaxCapacityExMB = Get-SizeMB ($_.MaxCapacityEx * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxCapacityExGB"){$_.MaxCapacityExGB = Get-SizeGB ($_.MaxCapacityEx * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxCapacityExTB"){$_.MaxCapacityExTB = Get-SizeTB ($_.MaxCapacityEx * 1KB)}
        if ($_.PSObject.Properties.Name -match "MaxCapacityExPB"){$_.MaxCapacityExPB = Get-SizePB ($_.MaxCapacityEx * 1KB)}
    }
    
    Write-Output $PhysicalMemoryArray
}