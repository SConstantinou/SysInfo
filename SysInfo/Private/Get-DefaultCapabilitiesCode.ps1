Function Get-DefaultCapabilitiesCode 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-DefaultCapabilitiesCode -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([uint16[]]$Code)

  if ($Code.Count -ne 0)
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
        'Color Printing'
      }
      3 
      {
        'Duplex Printing'
      }
      4 
      {
        'Copies'
      }
      5 
      {
        'Collation'
      }
      6 
      {
        'Stapling'
      }
      7 
      {
        'Transparency Printing'
      }
      8 
      {
        'Punch'
      }
      9 
      {
        'Cover'
      }
      10 
      {
        'Bind'
      }
      11 
      {
        'Black and White Printing'
      }
      12 
      {
        'One Sided'
      }
      13 
      {
        'Two Sided Long Edge'
      }
      14 
      {
        'Two Sided Short Edge'
      }
      15 
      {
        'Portrait'
      }
      16 
      {
        'Landscape'
      }
      17 
      {
        'Reverse Portrait'
      }
      18 
      {
        'Reverse Landscape'
      }
      19 
      {
        'Quality High'
      }
      20 
      {
        'Quality Normal'
      }
      21 
      {
        'Quality Low'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
