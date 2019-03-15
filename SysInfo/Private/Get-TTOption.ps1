Function Get-TTOption 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-TTOption -Code Value
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
        'Bitmap - Prints TrueType fonts as graphics'
      }
      2 
      {
        'Download - Downloads TrueType fonts as soft fonts'
      }
      3 
      {
        'Substitute - Substitutes device fonts for TrueType fonts'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
