function Get-DMAChannel {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    [System.Collections.ArrayList]$Properties = ((Get-CimClass -ClassName Win32_DMAChannel).CimClassProperties).Name
    $RemoveProperties = @("CreationClassName","CSCreationClassName")
    foreach ($_ in $RemoveProperties){$Properties.Remove($_)}

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