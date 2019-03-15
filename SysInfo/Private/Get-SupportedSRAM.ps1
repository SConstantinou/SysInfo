Function Get-SupportedSRAM 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-SupportedSRAM -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint16[]]$Code)

  if ($Code.Count -ne 0)
  {
    switch ($Code){
      0 
      {
        'Other'
      }
      1 
      {
        'Unknown'
      }
      2 
      {
        'Non-Burst'
      }
      3 
      {
        'Burst'
      }
      4 
      {
        'Pipeline Burst'
      }
      5 
      {
        'Synchronous'
      }
      6 
      {
        'Asynchronous'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
