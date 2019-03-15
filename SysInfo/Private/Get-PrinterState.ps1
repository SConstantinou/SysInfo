Function Get-PrinterState 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-PrinterState -Code Value
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
      0 
      {
        'Idle'
      }
      1 
      {
        'Paused'
      }
      2 
      {
        'Error'
      }
      3 
      {
        'Pending Deletion'
      }
      4 
      {
        'Paper Jam'
      }
      5 
      {
        'Paper Out'
      }
      6 
      {
        'Manual Feed'
      }
      7 
      {
        'Paper Problem'
      }
      8 
      {
        'Offline'
      }
      9 
      {
        'I/O Active'
      }
      10 
      {
        'Busy'
      }
      11 
      {
        'Printing'
      }
      12 
      {
        'Output Bin Full'
      }
      13 
      {
        'Not Available'
      }
      14 
      {
        'Waiting'
      }
      15 
      {
        'Processing'
      }
      16 
      {
        'Initialization'
      }
      17 
      {
        'Warming Up'
      }
      18 
      {
        'Toner Low'
      }
      19 
      {
        'No Toner'
      }
      20 
      {
        'Page Punt'
      }
      21 
      {
        'User Intervention Required'
      }
      22 
      {
        'Out of Memory'
      }
      23 
      {
        'Door Open'
      }
      24 
      {
        'Server_Unknown'
      }
      25 
      {
        'Power Save'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
