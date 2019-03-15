Function Get-Architecture 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-Architecture -Code Value
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
        'x86'
      }
      1 
      {
        'MIPS'
      }
      2 
      {
        'Alpha'
      }
      3 
      {
        'PowerPC'
      }
      5 
      {
        'ARM'
      }
      6 
      {
        'ia64 - Itanium-based systems'
      }
      9 
      {
        'x64'
      }
      10 
      {
        'PGA'
      }
      11 
      {
        'RIMM'
      }
      12 
      {
        'SODIMM'
      }
      13 
      {
        'SRIMM'
      }
      14 
      {
        'SMD'
      }
      15 
      {
        'SSMP'
      }
      16 
      {
        'QFP'
      }
      17 
      {
        'TQFP'
      }
      18 
      {
        'SOIC'
      }
      19 
      {
        'LCC'
      }
      20 
      {
        'PLCC'
      }
      21 
      {
        'BGA'
      }
      22 
      {
        'FPBGA'
      }
      23 
      {
        'LGA'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
