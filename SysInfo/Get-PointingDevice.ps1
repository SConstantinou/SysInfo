function Get-PointingDevice {

    $DeviceInterface = @{
        '1' = 'Other'
        '2' = 'Unknown'
        '3' = 'Serial'
        '4' = 'PS/2'
        '5' = 'Infrared'
        '6' = 'HP-HIL'
        '7' = 'Bus Mouse'
        '8' = 'ADB (Apple Desktop Bus)'
        '160' = 'Bus mouse DB-9'
        '161' = 'Bus mouse micro-DIN'
        '162' = 'USB'
    }
    
    $Properties = 'Name','Description','Caption','PowerManagementSupported','PowerManagementCapabilities',
                  'IsLocked','Handedness','NumberOfButtons','PointingType','Resolution','DeviceInterface',
                  'DoubleSpeedThreshold','HardwareType','Manufacturer','QuadSpeedThreshold','SampleRate',
                  'Synch','Status'

    $PointingDevice = Get-CimInstance -ClassName Win32_PointingDevice -Property $Properties | Select-Object $Properties
    $PointingDevice | ForEach-Object {$_.DeviceInterface = $DeviceInterface["$($_.DeviceInterface)"]}

    Write-Output $PointingDevice
}