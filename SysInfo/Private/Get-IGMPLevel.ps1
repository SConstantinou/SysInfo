Function Get-IGMPLevel 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-IGMPLevel -Code Value
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
        'No Multicast'
      }
      1 
      {
        'IP Multicast'
      }
      2 
      {
        'IP & IGMP multicast'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
