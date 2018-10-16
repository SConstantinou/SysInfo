function Get-OpticalSensor {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $OpticalSensor = Get-PointingDevice | Where-Object {$_.PointingType -eq 'Optical Sensor'}
    }
    else{

        $OpticalSensor = Get-PointingDevice -ComputerName $ComputerName | Where-Object {$_.PointingType -eq 'Optical Sensor'}
    }

    Write-Output $OpticalSensor
}