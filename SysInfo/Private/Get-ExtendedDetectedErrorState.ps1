Function Get-ExtendedDetectedErrorState 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ExtendedDetectedErrorState -Code Value
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
        'Unknown'
      }
      1 
      {
        'Other'
      }
      2 
      {
        'No Error'
      }
      3 
      {
        'Low Paper'
      }
      4 
      {
        'No Paper'
      }
      5 
      {
        'Low Toner'
      }
      6 
      {
        'No Toner'
      }
      7 
      {
        'Door Open'
      }
      8 
      {
        'Jammed'
      }
      9 
      {
        'Service Requested'
      }
      10 
      {
        'Output Bin Full'
      }
      11 
      {
        'Paper Problem'
      }
      12 
      {
        'Cannot Print Page'
      }
      13 
      {
        'User Intervention Required'
      }
      14 
      {
        'Out of Memory'
      }
      15 
      {
        'Server Unknown'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
