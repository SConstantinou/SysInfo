Function Get-PointingType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-PointingType -Code Value
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
        'Mouse'
      }
      4 
      {
        'Track Ball'
      }
      5 
      {
        'Track Point'
      }
      6 
      {
        'Glide Point'
      }
      7 
      {
        'Touch Pad'
      }
      8 
      {
        'Touch Screen'
      }
      9 
      {
        'Optical Sensor'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
