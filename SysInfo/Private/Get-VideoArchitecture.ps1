Function Get-VideoArchitecture 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-VideoArchitecture -Code Value
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
        'CGA'
      }
      4 
      {
        'EGA'
      }
      5 
      {
        'VGA'
      }
      6 
      {
        'SVGA'
      }
      7 
      {
        'MDA'
      }
      8 
      {
        'HGC'
      }
      9 
      {
        'MCGA'
      }
      10 
      {
        '8514A'
      }
      11 
      {
        'XGA'
      }
      12 
      {
        'Linear Frame Buffer'
      }
      160 
      {
        'PC-98'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
