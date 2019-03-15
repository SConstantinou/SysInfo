Function Get-WritePolicy 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-WritePolicy -Code Value
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
        'Write Back'
      }
      4 
      {
        'Write Through'
      }
      5 
      {
        'Varies with Address'
      }
      6 
      {
        'Determination Per I/O'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }
  Return
}
