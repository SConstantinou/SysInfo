function Get-DMAChannel {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DMAChannel).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DMAChannel = Get-CimInstance -ClassName Win32_DMAChannel -Property $Properties | Select-Object $Properties
    }
    else{

        $DMAChannel = Get-CimInstance -ClassName Win32_DMAChannel -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DMAChannel){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ByteMode = Get-ByteMode ($_.ByteMode)
        $_.ChannelTiming = Get-ChannelTiming ($_.ChannelTiming)
        $_.TypeCTiming = Get-TypeCTiming ($_.TypeCTiming)
        $_.WordMode = Get-WordMode ($_.WordMode)
    }
    
    Write-Output $DMAChannel
}