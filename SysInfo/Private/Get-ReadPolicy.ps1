Function Get-ReadPolicy 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ReadPolicy -Code Value
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
        'Read'
      }
      4 
      {
        'Read-Ahead'
      }
      5 
      {
        'Read and Read-Ahead'
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
