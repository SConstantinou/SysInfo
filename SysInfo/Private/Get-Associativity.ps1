Function Get-Associativity 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-Associativity -Code Value
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
        'Direct Mapped'
      }
      4 
      {
        '2-way Set-Associative'
      }
      5 
      {
        '4-way Set-Associative'
      }
      6 
      {
        'Fully Associative'
      }
      7 
      {
        '8-way Set-Associative'
      }
      8 
      {
        '16-way Set-Associative'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
