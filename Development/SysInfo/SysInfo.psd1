#
# Module manifest for module 'SysInfo'
#
# Generated by: Stephanos Constantinou
#
# Generated on: 18/10/2018
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'SysInfo.psm1'

# Version number of this module.
ModuleVersion = '1.0.2'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '79798ad8-b97e-4a28-b610-9ccd68f787e0'

# Author of this module
Author = 'Stephanos Constantinou'

# Company or vendor of this module
CompanyName = 'sconstantinou.com'

# Copyright statement for this module
Copyright = '(c) 2018 Stephanos Constantinou. All rights reserved.'

# Description of the functionality provided by this module
Description = 'SysInfo module will help you get the system information that you need from local and remote machines.
SysInfo will allow you to utilize CIM cmdlets in an easier way. Instead of trying to find the class name and filter
based on the return code to get the exact data that you need, you can get what you need with SysInfo module. It
utilizes CIM cmdlets to get the information from local and remote computer but the output of the properties of
the system components has no codes. Codes have been converted into a more readable format, giving you the
actual meaning of each code. As different types of sizes are provided in bytes, which in many times this is not
helpful, additional properties will be included in the output, providing you the size also in other format that
will help you out perform your job.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-1394Controller', 'Get-BaseBoard', 'Get-Battery', 'Get-BIOS',
               'Get-Bus', 'Get-CacheMemory', 'Get-CDROMDrive', 'Get-CompactDisc',
               'Get-Desktop', 'Get-DesktopMonitor','Get-DiskDrive','Get-DiskPartition',
               'Get-Fan','Get-FloppyController','Get-FloppyDrive','Get-GlidePoint',
               'Get-HeatPipe','Get-IDEController','Get-InfraredDevice','Get-Keyboard',
               'Get-LocalDisk','Get-LogicalDisk','Get-MemoryArray','Get-MemoryDevice',
               'Get-MotherboardDevice','Get-Mouse','Get-NetworkAdapter',
               'Get-NetworkAdapterConfiguration','Get-NetworkDrive','Get-OperatingSystem',
               'Get-OpticalSensor','Get-PhysicalMemory','Get-PhysicalMemoryArray',
               'Get-PointingDevice','Get-PortableBattery','Get-PrinterInfo',
               'Get-PrinterConfiguration','Get-Processor','Get-RAMDisk','Get-Refrigeration',
               'Get-RemovableDisk','Get-SCSIController','Get-SoundDevice','Get-SystemEnclosure',
               'Get-TapeDrive','Get-TemperatureProbe','Get-TouchPad','Get-TouchScreen',
               'Get-TrackBall','Get-TrackPoint','Get-USBController','Get-VideoController',
               'Get-VoltageProbe'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = 'SysInfo.psm1', 'SysInfo.psd1'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'System','Information','1394','Controller','BaseBoard','MotherBoard',
            'SystemBoard','Battery','BIOS','Bus','Cache','Memory','CD','DVD','ROM',
            'Drive','Compact','Disc','Desktop','Monitor','Disk','Partition','Fan',
            'Floppy','Glide','Point','HeatPipe','IDE','Infrared','Device','Keyboard',
            'Local','Logical','Array','Mouse'',Network','Adapter','Configuration',
            'Operating','OS','Optical','Sensor','Physical','Pointing','Portable',
            'Printer','Processor','CPU','Refrigaration','Cooling','Cooler',
            'Removable','USB','SD','RAM','DIMM','SCSI','Sound','Audio','Card',
            'Enclosure','Tape','Temperature','TouchPad','Touch','Pad','TouchScreen',
            'Screen','TrackBall','TrackPoint','Video','Graphics','Voltage'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/SConstantinou/SysInfo/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/SConstantinou/SysInfo'

        # A URL to an icon representing this module.
        IconUri = 'https://www.sconstantinou.com/sconstantinou_website_logo_small_publisher/'

        # ReleaseNotes of this module
        ReleaseNotes = '1.0.2 24-10-2018
* Fixed a bug on Get-SCSIController
* Fixed a bug on Get-VideoController

1.0.1 23-10-2018
* Renamed Get-Printer to Get-PrinterInfo
* Fixed a bug on Get-OperatingSystem for not retrieving OS for multiple systems.

1.0.0 22-10-2018
* Initial Realease'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

