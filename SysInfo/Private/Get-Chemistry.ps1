Function Get-Chemistry 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-Chemistry -Code Value
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
        'Lead Acid'
      }
      4 
      {
        'Nickel Cadmium'
      }
      5 
      {
        'Nickel Metal Hydride'
      }
      6 
      {
        'Lithium-ion'
      }
      7 
      {
        'Zinc air'
      }
      8 
      {
        'Lithium Polymer'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
