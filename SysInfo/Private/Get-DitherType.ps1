Function Get-DitherType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-DitherType -Code Value
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
      1 
      {
        'No Dithering'
      }
      2 
      {
        'Coarse Brush'
      }
      3 
      {
        'Fine Brush'
      }
      4 
      {
        'Line Art'
      }
      5 
      {
        'Grayscale'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
