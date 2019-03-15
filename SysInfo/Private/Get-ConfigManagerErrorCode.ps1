Function Get-ConfigManagerErrorCode 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ConfigManagerErrorCode -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>



  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint32]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      0 
      {
        'This device is working properly.'
      }
      1 
      {
        'This device is not configured correctly.'
      }
      2 
      {
        'Windows cannot load the driver for this device.'
      }
      3 
      {
        'The driver for this device might be corrupted, or your system may be running low on memory or other resources.'
      }
      4 
      {
        'This device is not working properly. One of its drivers or your registry might be corrupted.'
      }
      5 
      {
        'The driver for this device needs a resource that Windows cannot manage.'
      }
      6 
      {
        'The boot configuration for this device conflicts with other devices.'
      }
      7 
      {
        'Cannot filter.'
      }
      8 
      {
        'The driver loader for the device is missing.'
      }
      9 
      {
        'This device is not working properly because the controlling firmware is reporting the resources for the device incorrectly.'
      }
      10 
      {
        'This device cannot start.'
      }
      11 
      {
        'This device failed.'
      }
      12 
      {
        'This device cannot find enough free resources that it can use.'
      }
      13 
      {
        "Windows cannot verify this device's resources."
      }
      14 
      {
        'This device cannot work properly until you restart your computer.'
      }
      15 
      {
        'This device is not working properly because there is probably a re-enumeration problem.'
      }
      16 
      {
        'Windows cannot identify all the resources this device uses.'
      }
      17 
      {
        'This device is asking for an unknown resource type.'
      }
      18 
      {
        'Reinstall the drivers for this device.'
      }
      19 
      {
        'Failure using the VxD loader.'
      }
      20 
      {
        'Your registry might be corrupted.'
      }
      21 
      {
        'System failure: Try changing the driver for this device. If that does not work, see your hardware documentation. Windows is removing this device.'
      }
      22 
      {
        'This device is disabled.'
      }
      23 
      {
        "System failure: Try changing the driver for this device. If that doesn't work, see your hardware documentation."
      }
      24 
      {
        'This device is not present, is not working properly, or does not have all its drivers installed.'
      }
      25 
      {
        'Windows is still setting up this device.'
      }
      26 
      {
        'Windows is still setting up this device.'
      }
      27 
      {
        'This device does not have valid log configuration.'
      }
      28 
      {
        'The drivers for this device are not installed.'
      }
      29 
      {
        'This device is disabled because the firmware of the device did not give it the required resources.'
      }
      30 
      {
        'This device is using an Interrupt Request (IRQ) resource that another device is using.'
      }
      31 
      {
        'This device is not working properly because Windows cannot load the drivers required for this device.'
      }
      deafult 
      {
        'Invalid Code'
      }
    }
  }

  Return
}