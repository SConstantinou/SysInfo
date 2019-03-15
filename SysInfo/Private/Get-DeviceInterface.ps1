Function Get-DeviceInterface 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-DeviceInterface -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint16]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      1 
      {
        'Other'
      }
      2 
      {
        'Unknown'
      }
      3 
      {
        'Serial'
      }
      4 
      {
        'PS/2'
      }
      5 
      {
        'Infrared'
      }
      6 
      {
        'HP-HIL'
      }
      7 
      {
        'Bus Mouse'
      }
      8 
      {
        'ADB (Apple Desktop Bus)'
      }
      160 
      {
        'Bus mouse DB-9'
      }
      161 
      {
        'Bus mouse micro-DIN'
      }
      162 
      {
        'USB'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
