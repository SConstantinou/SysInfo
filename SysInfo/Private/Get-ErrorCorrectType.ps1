﻿Function Get-ErrorCorrectType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ErrorCorrectType  -Code Value
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
        'Reserved'
      }
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
        'None'
      }
      4 
      {
        'Parity'
      }
      5 
      {
        'Single-bit ECC'
      }
      6 
      {
        'Multi-bit ECC'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
