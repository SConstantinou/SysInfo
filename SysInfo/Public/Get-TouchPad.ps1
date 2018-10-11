function Get-TouchPad {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $TouchPad = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Touch Pad'}
    }
    else{

        $TouchPad = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Touch Pad'}
    }

    Write-Output $TouchPad
}