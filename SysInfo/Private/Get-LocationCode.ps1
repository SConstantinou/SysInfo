Function Get-LocationCode 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-LocationCode -Code Value
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
        'Internal'
      }
      1 
      {
        'External'
      }
      2 
      {
        'Reserved'
      }
      3 
      {
        'Unknown'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
