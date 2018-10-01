function Get-PhysicalMedia {

    $Properties = ((Get-CimClass -ClassName Win32_PhysicalMedia).CimClassProperties).Name

    $PhysicalMedia = Get-CimInstance -ClassName Win32_PhysicalMedia -Property $Properties | Select-Object $Properties
    
    $PhysicalMedia |
        ForEach-Object {
            if($_.Capacity -ne $null){
                $_.Capacity  = [math]::Round($_.Size / 1GB)
            }
        } #change the name

    foreach ($_ in $PhysicalMedia){

        $_.MediaType = Get-MediaType ($_.MediaType)
    }
    
    Write-Output $PhysicalMedia
}