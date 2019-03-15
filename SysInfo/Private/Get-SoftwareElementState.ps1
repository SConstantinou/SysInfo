Function Get-SoftwareElementState 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-SoftwareElementState -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.Sting
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint16]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      0 
      {
        'Deployable'
      }
      1 
      {
        'Installable'
      }
      2 
      {
        'Executable'
      }
      3 
      {
        'Running'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
