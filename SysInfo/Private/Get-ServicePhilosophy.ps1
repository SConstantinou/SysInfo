Function Get-ServicePhilosophy 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ServicePhilosophy -Code Value
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
        'Service From Top'
      }
      3 
      {
        'Service From Front'
      }
      4 
      {
        'Service From Back'
      }
      5 
      {
        'Service From Side'
      }
      6 
      {
        'Sliding Trays'
      }
      7 
      {
        'Removable Sides'
      }
      8 
      {
        'Moveable'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }
  Return
}
