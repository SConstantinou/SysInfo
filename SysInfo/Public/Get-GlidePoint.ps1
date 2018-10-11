function Get-GlidePoint {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $GlidePoint = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Glide Point'}
    }
    else{

        $GlidePoint = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Glide Point'}
    }

    Write-Output $GlidePoint
}