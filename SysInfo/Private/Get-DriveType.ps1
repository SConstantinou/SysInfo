Function Get-DriveType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-DriveType -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint32]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      0 
      {
        'Unknown'
      }
      1 
      {
        'No Root Directory'
      }
      2 
      {
        'Removable Disk'
      }
      3 
      {
        'Local Disk'
      }
      4 
      {
        'Network Drive'
      }
      5 
      {
        'Compact Disc'
      }
      6 
      {
        'RAM Disk'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
