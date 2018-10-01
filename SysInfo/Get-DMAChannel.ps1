function Get-DMAChannel {

    $Properties = ((Get-CimClass -ClassName Win32_DMAChannel).CimClassProperties).Name

    $DMAChannel = Get-CimInstance -ClassName Win32_DMAChannel -Property $Properties | Select-Object $Properties

    foreach ($_ in $DMAChannel){

        $_.Availability = Get-Availability ($_.Availability)
        $_.ByteMode = Get-ByteMode ($_.ByteMode)
        $_.ChannelTiming = Get-ChannelTiming ($_.ChannelTiming)
        $_.TypeCTiming = Get-TypeCTiming ($_.TypeCTiming)
        $_.WordMode = Get-WordMode ($_.WordMode)
    }
    
    Write-Output $DMAChannel
}