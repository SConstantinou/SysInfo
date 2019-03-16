# SysInfo

SysInfo module will help you get the system information that you need from local and remote machines.
SysInfo will allow you to utilize CIM cmdlets in an easier way. Instead of trying to find the class name and filter
based on the return code to get the exact data that you need, you can get what you need with SysInfo module. It
utilizes CIM cmdlets to get the information from local and remote computer but the output of the properties of
the system components has no codes. Codes have been converted into a more readable format, giving you the
actual meaning of each code. As different types of sizes are provided in bytes, which in many times this is not
helpful, additional properties will be included in the output, providing you the size also in other format that
will help you out perform your job.

---

### Commands

* [Get-1394Controller](https://www.sconstantinou.com/Get-1394Controller)
* [Get-BaseBoard](https://www.sconstantinou.com/Get-BaseBoard)
* [Get-Battery](https://www.sconstantinou.com/Get-Battery)
* [Get-BIOS](https://www.sconstantinou.com/Get-BIOS)
* [Get-Bus](https://www.sconstantinou.com/Get-Bus)
* [Get-CacheMemory](https://www.sconstantinou.com/Get-CacheMemory)
* [Get-CDROMDrive](https://www.sconstantinou.com/Get-CDROMDrive)
* [Get-CompactDisc](https://www.sconstantinou.com/Get-CompactDisc)
* [Get-Desktop](https://www.sconstantinou.com/Get-Desktop)
* [Get-DesktopMonitor](https://www.sconstantinou.com/Get-DesktopMonitor)
* [Get-DiskDrive](https://www.sconstantinou.com/Get-DiskDrive)
* [Get-DiskPartition](https://www.sconstantinou.com/Get-DiskPartition)
* [Get-Fan](https://www.sconstantinou.com/Get-Fan)
* [Get-FloppyController](https://www.sconstantinou.com/Get-FloppyController)
* [Get-FloppyDrive](https://www.sconstantinou.com/Get-FloppyDrive)
* [Get-GlidePoint](https://www.sconstantinou.com/Get-GlidePoint)
* [Get-HeatPipe](https://www.sconstantinou.com/Get-HeatPipe)
* [Get-IDEController](https://www.sconstantinou.com/Get-IDEController)
* [Get-InfraredDevice](https://www.sconstantinou.com/Get-InfraredDevice)
* [Get-Keyboard](https://www.sconstantinou.com/Get-Keyboard)
* [Get-LocalDisk](https://www.sconstantinou.com/Get-LocalDisk)
* [Get-LogicalDisk](https://www.sconstantinou.com/Get-LogicalDisk)
* [Get-MemoryArray](https://www.sconstantinou.com/Get-MemoryArray)
* [Get-MemoryDevice](https://www.sconstantinou.com/Get-MemoryDevice)
* [Get-MotherboardDevice](https://www.sconstantinou.com/Get-MotherboardDevice)
* [Get-Mouse](https://www.sconstantinou.com/Get-Mouse)
* [Get-NetworkAdapter](https://www.sconstantinou.com/Get-NetworkAdapter)
* [Get-NetworkAdapterConfiguration](https://www.sconstantinou.com/Get-NetworkAdapterConfiguration)
* [Get-NetworkDrive](https://www.sconstantinou.com/Get-NetworkDrive)
* [Get-OperatingSystem](https://www.sconstantinou.com/Get-OperatingSystem)
* [Get-OpticalSensor](https://www.sconstantinou.com/Get-OpticalSensor)
* [Get-PhysicalMemory](https://www.sconstantinou.com/Get-PhysicalMemory)
* [Get-PhysicalMemoryArray](https://www.sconstantinou.com/Get-PhysicalMemoryArray)
* [Get-PointingDevice](https://www.sconstantinou.com/Get-PointingDevice)
* [Get-PortableBattery](https://www.sconstantinou.com/Get-PortableBattery)
* [Get-PrinterConfiguration](https://www.sconstantinou.com/Get-PrinterConfiguration)
* [Get-PrinterInfo](https://www.sconstantinou.com/Get-PrinterInfo)
* [Get-Processor](https://www.sconstantinou.com/Get-Processor)
* [Get-RAMDisk](https://www.sconstantinou.com/Get-RAMDisk)
* [Get-Refrigeration](https://www.sconstantinou.com/Get-Refrigeration)
* [Get-RemovableDisk](https://www.sconstantinou.com/Get-RemovableDisk)
* [Get-SCSIController](https://www.sconstantinou.com/Get-SCSIController)
* [Get-SoundDevice](https://www.sconstantinou.com/Get-SoundDevice)
* [Get-SystemEnclosure](https://www.sconstantinou.com/Get-SystemEnclosure)
* [Get-TapeDrive](https://www.sconstantinou.com/Get-TapeDrive)
* [Get-TemperatureProbe](https://www.sconstantinou.com/Get-TemperatureProbe)
* [Get-TouchPad](https://www.sconstantinou.com/Get-TouchPad)
* [Get-TouchScreen](https://www.sconstantinou.com/Get-TouchScreen)
* [Get-TrackBall](https://www.sconstantinou.com/Get-TrackBall)
* [Get-TrackPoint](https://www.sconstantinou.com/Get-TrackPoint)
* [Get-USBController](https://www.sconstantinou.com/Get-USBController)
* [Get-VideoController](https://www.sconstantinou.com/Get-VideoController)
* [Get-VoltageProbe](https://www.sconstantinou.com/Get-VoltageProbe)

---

### Release Notes

* __1.2.0 14-03-2019__
  * Credential parameter added
  * Authentication parameter added
  * Properties are now sorted in alphabetical order
  * Some internal functions have been renamed
  * Code Improvements
  * Bug fixes

* __1.1.3 20-11-2018__
  * Get-FloppyDrive renamed to Get-FloppyDriveSysInfo
  * Get-NetworkAdapter renamed to GetNetworkAdapterSysInfo
  * Get-PrinterInfo renamed to Get-PrinterSysInfo
  * Get-SCSIController renamed to Get-SCSIControllerSysInfo
  * Fixed typo errors in help info

* __1.1.2 13-11-2018__
  * Fixed Wildcard bug on Properties parameter

* __1.1.1 12-11-2018__
  * Removed Miminum PowerShell Version

* __1.1.0 12-11-2018__
  * FreeSpacePercentage property added
  * UsedSpacePercentage property added
  * Added protocol choice (WinRM, DCOM)
  * Added Properties parameter
  * Code Improvements

* __1.0.2 24/10/2018__
  * Fixed a bug on Get-SCSIController
  * Fixed a bug on Get-VideoController

* __1.0.1 23/10/2018__
  * Renamed Get-Printer to Get-PrinterInfo
  * Fixed a bug on Get-OperatingSystem for not retrieving OS for multiple systems.

* __1.0.0 22/10/2018__
  * Initial Realease

### More Information

For more information please check

[https://www.sconstantinou.com/powershell-module-sysinfo](https://www.sconstantinou.com/powershell-module-sysinfo)
