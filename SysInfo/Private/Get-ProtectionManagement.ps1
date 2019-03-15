Function Get-ProtectionManagement 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ProtectionManagement -Code Value
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
        'Unprotected'
      }
      4 
      {
        'Protected'
      }
      5 
      {
        'Protected through SCC (SCSI-3 Controller Command)'
      }
      6 
      {
        'Protected through SCC-2 (SCSI-3 Controller Command)'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
