Function Get-BatteryStatus 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-BatteryStatus -Code Value
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
        'Other - The battery is discharging'
      }
      2 
      {
        'Unknown - The system has access to AC so no battery is being discharged. However, the battery is not necessarily charging.'
      }
      3 
      {
        'Fully Charged'
      }
      4 
      {
        'Low'
      }
      5 
      {
        'Critical'
      }
      6 
      {
        'Charging'
      }
      7 
      {
        'Charging and High'
      }
      8 
      {
        'Charging and Low'
      }
      9 
      {
        'Charging and Critical'
      }
      10 
      {
        'Undefined'
      }
      11 
      {
        'Partially Charged'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
