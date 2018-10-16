function Get-TrackBall {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $TrackBall = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Track Ball'}
    }
    else{

        $TrackBall = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Track Ball'}
    }

    Write-Output $TrackBall
}