Function Get-CpuStatus 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-CpuStatus -Code Value
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
        'CPU Enabled'
      }
      2 
      {
        'CPU Disabled by User via BIOS Setup'
      }
      3 
      {
        'CPU Disabled By BIOS (POST Error)'
      }
      4 
      {
        'CPU is Idle'
      }
      5 
      {
        'Reserved'
      }
      6 
      {
        'Reserved'
      }
      7 
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
