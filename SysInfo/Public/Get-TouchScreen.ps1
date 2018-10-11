function Get-TouchScreen {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $TouchScreen = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Touch Screen'}
    }
    else{

        $TouchScreen = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Touch Screen'}
    }

    Write-Output $TouchScreen
}