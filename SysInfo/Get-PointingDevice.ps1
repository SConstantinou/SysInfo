function Get-PointingDevice {

    $Availability = @{
        '1' = 'Other'
        '2' = 'Unknown'
        '3' = 'Running or Full Power'
        '4' = 'Warning'
        '5' = 'In Test'
        '6' = 'Not Applicable'
        '7' = 'Power Off'
        '8' = 'Off Line'
        '9' = 'Off Duty'
        '10' = 'Degraded'
        '11' = 'Not Installed'
        '12' = 'Install Error'
        '13' = 'Power Save - Unknown'
        '14' = 'Power Save - Low Power Mode'
        '15' = 'Power Save - Standby'
        '16' = 'Power Cycle'
        '17' = 'Power Save - Warning'
        '18' = 'Pause'
        '19' = 'Not Ready'
        '20' = 'Not Configured'
        '21' = 'Quiesced - Device is Quiet'
    }

    $ConfigManagerErrorCode = @{
        '0' = 'This device is working properly.'
        '1' = 'This device is not configured correctly.'
        '2' = 'Windows cannot load the driver for this device.'
        '3' = 'The driver for this device might be corrupted, or your system may be running low on memory or other resources.'
        '4' = 'This device is not working properly. One of its drivers or your registry might be corrupted.'
        '5' = 'The driver for this device needs a resource that Windows cannot manage.'
        '6' = 'The boot configuration for this device conflicts with other devices.'
        '7' = 'Cannot filter.'
        '8' = 'The driver loader for the device is missing.'
        '9' = 'This device is not working properly because the controlling firmware is reporting the resources for the device incorrectly.'
        '10' = 'This device cannot start.'
        '11' = 'This device failed.'
        '12' = 'This device cannot find enough free resources that it can use.'
        '13' = "Windows cannot verify this device's resources."
        '14' = 'This device cannot work properly until you restart your computer.'
        '15' = 'This device is not working properly because there is probably a re-enumeration problem.'
        '16' = 'Windows cannot identify all the resources this device uses.'
        '17' = 'This device is asking for an unknown resource type.'
        '18' = 'Reinstall the drivers for this device.'
        '19' = 'Failure using the VxD loader.'
        '20' = 'Your registry might be corrupted.'
        '21' = 'System failure: Try changing the driver for this device. If that does not work, see your hardware documentation. Windows is removing this device.'
        '22' = 'This device is disabled.'
        '23' = "System failure: Try changing the driver for this device. If that doesn't work, see your hardware documentation."
        '24' = 'This device is not present, is not working properly, or does not have all its drivers installed.'
        '25' = 'Windows is still setting up this device.'
        '26' = 'Windows is still setting up this device.'
        '27' = 'This device does not have valid log configuration.'
        '28' = 'The drivers for this device are not installed.'
        '29' = 'This device is disabled because the firmware of the device did not give it the required resources.'
        '30' = 'This device is using an Interrupt Request (IRQ) resource that another device is using.'
        '31' = 'This device is not working properly because Windows cannot load the drivers required for this device.'
    }

    $PowerManagementCapabilities = @{
        '0' = 'Unknown'
        '1' = 'Not Supported'
        '2' = 'Disabled'
        '3' = 'Enabled'
        '4' = 'Power Saving Modes Entered Automatically'
        '5' = 'Power State Settable'
        '6' = 'Power Cycling Supported'
        '7' = 'Timed Power On Supported'
    }

    $StatusInfo = @{
        '1' = 'Other'
        '2' = 'Unknown'
        '3' = 'Enabled'
        '4' = 'Disabled'
        '5' = 'Not Applicable'
    }
    
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

    $PointingType = @{
        '1' = 'Other'
        '2' = 'Unknown'
        '3' = 'Mouse'
        '4' = 'Track Ball'
        '5' = 'Track Point'
        '6' = 'Glide Point'
        '7' = 'Touch Pad'
        '8' = 'Touch Screen'
        '9' = 'Optical Sensor'
    }
    
    $Properties = 'Name','Description','Caption','PowerManagementSupported','PowerManagementCapabilities',
                  'ConfigManagerErrorCode','ConfigManagerUserConfig','IsLocked','Handedness','NumberOfButtons',
                  'PointingType','Resolution','DeviceInterface','DoubleSpeedThreshold','HardwareType',
                  'Manufacturer','QuadSpeedThreshold','SampleRate','Synch','StatusInfo','Status'

    $PointingDevice = Get-CimInstance -ClassName Win32_PointingDevice -Property $Properties | Select-Object $Properties
    $PointingDevice | ForEach-Object {$_.DeviceInterface = $DeviceInterface["$($_.DeviceInterface)"]}
    $PointingDevice | ForEach-Object {$_.PointingType = $PointingType["$($_.PointingType)"]}
    $PointingDevice | ForEach-Object {$_.Availability = $Availability["$($_.Availability)"]}
    $PointingDevice | ForEach-Object {$_.ConfigManagerErrorCode = $ConfigManagerErrorCode["$($_.ConfigManagerErrorCode)"]}
    $PointingDevice | ForEach-Object {$_.PowerManagementCapabilities = $PowerManagementCapabilities["$($_.PowerManagementCapabilities)"]}
    $PointingDevice | ForEach-Object {$_.StatusInfo = $StatusInfo["$($_.StatusInfo)"]}

    Write-Output $PointingDevice
}