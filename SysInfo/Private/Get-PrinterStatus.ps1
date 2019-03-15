Function Get-PrinterStatus 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-PrinterStatus -Code Value
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
        'Idle'
      }
      4 
      {
        'Printing'
      }
      5 
      {
        'Warmup'
      }
      6 
      {
        'Stopped Printing'
      }
      7 
      {
        'Offline'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
