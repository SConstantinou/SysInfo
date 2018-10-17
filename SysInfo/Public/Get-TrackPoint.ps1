function Get-TrackPoint {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $TrackPoint = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Track Point'}
    }
    else{

        $TrackPoint = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Track Point'}
    }

    Write-Output $TrackPoint
}