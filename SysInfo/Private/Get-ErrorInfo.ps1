Function Get-ErrorInfo 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ErrorInfo -Code Value
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
        'OK'
      }
      4 
      {
        'Bad Read'
      }
      5 
      {
        'Parity Error'
      }
      6 
      {
        'Single-Bit Error'
      }
      7 
      {
        'Double-Bit Error'
      }
      8 
      {
        'Multi-Bit Error'
      }
      9 
      {
        'Nibble Error'
      }
      10 
      {
        'Checksum Error'
      }
      11 
      {
        'CRC Error'
      }
      12 
      {
        'Corrected single-bit error'
      }
      13 
      {
        'Corrected error'
      }
      14 
      {
        'Uncorrectable error'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
