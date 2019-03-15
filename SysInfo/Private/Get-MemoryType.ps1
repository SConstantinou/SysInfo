Function Get-MemoryType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-MemoryType -Code Value
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
        'Other'
      }
      2 
      {
        'DRAM'
      }
      3 
      {
        'Synchronous DRAM'
      }
      4 
      {
        'Cache DRAM'
      }
      5 
      {
        'EDO'
      }
      6 
      {
        'EDRAM'
      }
      7 
      {
        'VRAM'
      }
      8 
      {
        'SRAM'
      }
      9 
      {
        'RAM'
      }
      10 
      {
        'ROM'
      }
      11 
      {
        'Flash'
      }
      12 
      {
        'EEPROM'
      }
      13 
      {
        'FEPROM'
      }
      14 
      {
        'EPROM'
      }
      15 
      {
        'CDRAM'
      }
      16 
      {
        '3DRAM'
      }
      17 
      {
        'SDRAM'
      }
      18 
      {
        'SGRAM'
      }
      19 
      {
        'RDRAM'
      }
      20 
      {
        'DDR'
      }
      21 
      {
        'DDR2'
      }
      22 
      {
        'BRAM'
      }
      23 
      {
        'FB-DIMM'
      }
      24 
      {
        'DDR3'
      }
      25 
      {
        'FBD2'
      }
      26 
      {
        'DDR4'
      }
      27 
      {
        'LPDDR'
      }
      28 
      {
        'LPDDR2'
      }
      29 
      {
        'LPDDR3'
      }
      30 
      {
        'LPDDR4'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
