Function Get-ProductType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ProductType -Code Value
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
      1 
      {
        'Work Station'
      }
      2 
      {
        'Domain Controller'
      }
      3 
      {
        'Server'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
