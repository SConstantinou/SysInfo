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
            {$MaxCapacity -ge 1MB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityMB" -Value "" -Force
                }
            {$MaxCapacity -ge 1GB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityGB" -Value "" -Force
                }
            {$MaxCapacity -ge 1TB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityTB" -Value "" -Force
                }
            {$MaxCapacity -ge 1PB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityPB" -Value "" -Force
                }
        }

        switch ($MaxCapacityEx){
            {$MaxCapacityEx -ge 1MB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExMB" -Value "" -Force
                }
            {$MaxCapacityEx -ge 1GB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExGB" -Value "" -Force
                }
            {$MaxCapacityEx -ge 1TB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExTB" -Value "" -Force
                }
            {$MaxCapacityEx -ge 1PB}
                {
                    $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name "MaxCapacityExPB" -Value "" -Force
                }
        }

        if ($null -ne $_.Depth){
            $PhysicalMemoryArray |
                Add-Member -MemberType NoteProperty -Name "DepthCM" -Value "$(Get-LengthCM ($_.Depth))" -Force
        }

        if ($null -ne $_.Height){
            $PhysicalMemoryArray |
                Add-Member -MemberType NoteProperty -Name "HeightCM" -Value "$(Get-LengthCM ($_.Height))" -Force
        }

        if ($null -ne $_.Width){
            $PhysicalMemoryArray |
                Add-Member -MemberType NoteProperty -Name "WidthCM" -Value "$(Get-LengthCM ($_.Width))" -Force
        }
        
        if ($null -ne $_.Weight){
            $PhysicalMemoryArray |
                Add-Member -MemberType NoteProperty -Name "WeightGr" -Value "$(Get-WeightGram ($_.Weight))" -Force
        }

        if (($_.PSObject.Properties.Name -match "WeightGr") -and ($_.WeightGr -ge 1000)){
            $PhysicalMemoryArray |
                Add-Member -MemberType NoteProperty -Name "WeightKg" -Value "$(Get-WeightKg ($_.Weight))" -Force
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

    