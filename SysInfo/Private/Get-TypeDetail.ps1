Function Get-TypeDetail 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-TypeDetail -Code Value
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
      '1' 
      {
        'Reserved'
      }
      '2' 
      {
        'Other'
      }
      '4' 
      {
        'Unknown'
      }
      '8' 
      {
        'Fast-paged'
      }
      '16' 
      {
        'Static column'
      }
      '32' 
      {
        'Pseudo-static'
      }
      '64' 
      {
        'RAMBUS'
      }
      '128' 
      {
        'Synchronous'
      }
      '256' 
      {
        'CMOS'
      }
      '512' 
      {
        'EDO'
      }
      '1024' 
      {
        'Window DRAM'
      }
      '2048' 
      {
        'Cache DRAM'
      }
      '4096' 
      {
        'Non-volatile'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
