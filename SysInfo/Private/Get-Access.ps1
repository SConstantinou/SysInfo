Function Get-Access 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-Access -Code Value
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
        'Readable'
      }
      2 
      {
        'Writeable'
      }
      3 
      {
        'Read/Write Supported'
      }
      4 
      {
        'Write Once'
      }
      5 
      {
        'Not Applicable'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
