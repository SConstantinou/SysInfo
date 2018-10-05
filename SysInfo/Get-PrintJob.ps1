function Get-PrintJob {

    $Properties = ((Get-CimClass -ClassName Win32_PrintJob).CimClassProperties).Name

    $PrintJob = Get-CimInstance -ClassName Win32_PrintJob -Property $Properties | Select-Object $Properties

    foreach ($_ in $PrintJob){

        $_.StatusMask = Get-StatusMask ($_.StatusMask)
    }
    
    Write-Output $PrintJob
}