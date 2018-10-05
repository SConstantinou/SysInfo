function Get-PhysicalMedia {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_PhysicalMedia).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $PhysicalMedia = Get-CimInstance -ClassName Win32_PhysicalMedia -Property $Properties | Select-Object $Properties
    }
    else{

        $PhysicalMedia = Get-CimInstance -ClassName Win32_PhysicalMedia -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }
    
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