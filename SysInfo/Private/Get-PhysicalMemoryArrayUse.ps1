Function Get-PhysicalMemoryArrayUse 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-PhysicalMemoryArrayUse -Code Value
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
        'Reserved'
      }
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
        'System memory'
      }
      4 
      {
        'Video memory'
      }
      5 
      {
        'Flash memory'
      }
      6 
      {
        'Non-volatile RAM'
      }
      7 
      {
        'Cache memory'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
