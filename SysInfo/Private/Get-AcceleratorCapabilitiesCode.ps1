Function Get-AcceleratorCapabilitiesCode 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-AcceleratorCapabilitiesCode -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([uint16[]]$Code)

  if ($Code.Count -ne 0)
  {
    switch ($Code){
      0 
      {
        'Unknown'
      }
      1 
      {
        'Other'
      }
      2 
      {
        'Graphics Accelerator'
      }
      3 
      {
        '3D Accelerator'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
