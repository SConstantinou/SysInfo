function Get-Mouse {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $Mouse = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Mouse'}
    }
    else{

        $Mouse = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Mouse'}
    }

    Write-Output $Mouse
}