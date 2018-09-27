function Get-CDROMDrive {

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

    $Properties = 'Availability','Drive','ErrorCleared','MediaLoaded','NeedsCleaning',
        'Status','StatusInfo','Caption','Derscription','InstallDate','Name','ConfigManagerErrorCode',
        'ConfigManagerUserConfig','ErrorDescription','LastErrorCode','PowerManagementCapabilities',
        'PowerManagementSupported','SystemName','Capabilities','CapabilityDescriptions','CompressionMethod',
        'DefaultBlockSize','ErrorMethodology','MaxBlockSize','MaxMediaSize','MinBlockSize','NumberOfMediaSupported',
        'DriveIntegrity','FileSystemFlags','FileSystemFlagsEx','Id','Manufacturer','MaximumComponentLength',
        'MediaType','MfrAssignedRevisionLevel','RevisionLevel','SCSIBus','SCSILogicalUnit','SCSIPort',
        'SCSITargetId','SerialNumber','Size','TransferRate','VolumeName','VolumeSerialNumber'

    $CDROMDrive = Get-CimInstance -ClassName Win32_CDROMDrive -Property $Properties | Select-Object $Properties
    $CDROMDrive | ForEach-Object {$_.Availability = $Availability["$($_.Availability)"]}
    $CDROMDrive | ForEach-Object {$_.ConfigManagerErrorCode = $ConfigManagerErrorCode["$($_.ConfigManagerErrorCode)"]}
    $CDROMDrive | ForEach-Object {$_.PowerManagementCapabilities = $PowerManagementCapabilities["$($_.PowerManagementCapabilities)"]}
    $CDROMDrive | ForEach-Object {$_.StatusInfo = $StatusInfo["$($_.StatusInfo)"]}
    
    Write-Output $Keyboard
}