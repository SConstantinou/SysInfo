Function Get-InterleavePosition 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-InterleavePosition -Code Value
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
      0 
      {
        'Noninterleaved'
      }
      1 
      {
        'First position'
      }
      2 
      {
        'Second position'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
