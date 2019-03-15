Function Get-Orientation 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-Orientation -Code Value
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
        'Portrait'
      }
      2 
      {
        'Landscape'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
