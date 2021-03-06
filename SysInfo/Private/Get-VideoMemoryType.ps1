﻿Function Get-VideoMemoryType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-VideoMemoryType -Code Value
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
        'VRAM'
      }
      4 
      {
        'DRAM'
      }
      5 
      {
        'SRAM'
      }
      6 
      {
        'WRAM'
      }
      7 
      {
        'EDO RAM'
      }
      8 
      {
        'Burst Synchronous DRAM'
      }
      9 
      {
        'Pipelined Burst SRAM'
      }
      10 
      {
        'CDRAM'
      }
      11 
      {
        '3DRAM'
      }
      12 
      {
        'SDRAM'
      }
      13 
      {
        'SGRAM'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
