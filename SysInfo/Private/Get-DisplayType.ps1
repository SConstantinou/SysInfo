Function Get-DisplayType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-DisplayType -Code Value
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
        'Multiscan Color'
      }
      3 
      {
        'Multiscan Monochrome'
      }
      4 
      {
        'Fixed Frequency Color'
      }
      5 
      {
        'Fixed Frequency Monochrome'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
