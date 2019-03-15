Function Get-ReplacementPolicy 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ReplacementPolicy -Code Value
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
        'Least Recently Used (LRU)'
      }
      4 
      {
        'First In First Out (FIFO)'
      }
      5 
      {
        'Last In First Out (LIFO)'
      }
      6 
      {
        'Least Frequently Used (LFU)'
      }
      7 
      {
        'Most Frequently Used (MFU)'
      }
      8 
      {
        'Data Dependent Multiple Algorithms'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
