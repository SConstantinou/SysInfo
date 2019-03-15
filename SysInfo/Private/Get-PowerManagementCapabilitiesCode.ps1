Function Get-PowerManagementCapabilitiesCode 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-PowerManagementCapabilitiesCode -Code Value
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
        'Not Supported'
      }
      2 
      {
        'Disabled'
      }
      3 
      {
        'Enabled'
      }
      4 
      {
        'Power Saving Modes Entered Automatically'
      }
      5 
      {
        'Power State Settable'
      }
      6 
      {
        'Power Cycling Supported'
      }
      7 
      {
        'Timed Power On Supported'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}