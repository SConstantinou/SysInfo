Function Get-NetConnectionStatus 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-NetConnectionStatus -Code Value
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
        'Disconnected'
      }
      1 
      {
        'Connecting'
      }
      2 
      {
        'Connected'
      }
      3 
      {
        'Disconnecting'
      }
      4 
      {
        'Hardware Not Present'
      }
      5 
      {
        'Hardware Disabled'
      }
      6 
      {
        'Hardware Malfunction'
      }
      7 
      {
        'Media Disconnected'
      }
      8 
      {
        'Authenticating'
      }
      9 
      {
        'Authentication Succeeded'
      }
      10 
      {
        'Authentication Failed'
      }
      11 
      {
        'Invalid Address'
      }
      12 
      {
        'Credentials Required'
      }
      {
        13..65535 -contains $_
      } 
      {
        'Other'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
