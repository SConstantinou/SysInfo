Function Get-DataExecutionPreventionSupportPolicy 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-DataExecutionPreventionSupportPolicy -Code Value
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
        'Always Off'
      }
      1 
      {
        'Always On'
      }
      2 
      {
        'Opt In'
      }
      3 
      {
        'Opt Out'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
