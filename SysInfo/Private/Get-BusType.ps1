Function Get-BusType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-BusType -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.Sting
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint32]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      -1 
      {
        'Undefined'
      }
      0 
      {
        'Internal'
      }
      1 
      {
        'ISA'
      }
      2 
      {
        'EISA'
      }
      3 
      {
        'MicroChannel'
      }
      4 
      {
        'TurboChannel'
      }
      5 
      {
        'PCI Bus'
      }
      6 
      {
        'VME Bus'
      }
      7 
      {
        'NuBus'
      }
      8 
      {
        'PCMCIA Bus'
      }
      9 
      {
        'C Bus'
      }
      10 
      {
        'MPI Bus'
      }
      11 
      {
        'MPSA Bus'
      }
      12 
      {
        'Internal Processor'
      }
      13 
      {
        'Internal Power Bus'
      }
      14 
      {
        'PNP ISA Bus'
      }
      15 
      {
        'PNP Bus'
      }
      16 
      {
        'Maximum Interface Type'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
