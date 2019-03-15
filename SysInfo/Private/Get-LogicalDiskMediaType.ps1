Function Get-LogicalDiskMediaType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-LogicalDiskMediaType -Code Value
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
        'Format is unknown'
      }
      1 
      {
        '5 1/4-Inch Floppy Disk - 1.2 MB - 512 bytes/sector'
      }
      2 
      {
        '3 1/2-Inch Floppy Disk - 1.44 MB - 512 bytes/sector'
      }
      3 
      {
        '3 1/2-Inch Floppy Disk - 2.88 MB - 512 bytes/sector'
      }
      4 
      {
        '3 1/2-Inch Floppy Disk - 20.8 MB - 512 bytes/sector'
      }
      5 
      {
        '3 1/2-Inch Floppy Disk - 720 KB - 512 bytes/sector'
      }
      6 
      {
        '5 1/4-Inch Floppy Disk - 360 KB - 512 bytes/sector'
      }
      7 
      {
        '5 1/4-Inch Floppy Disk - 320 KB - 512 bytes/sector'
      }
      8 
      {
        '5 1/4-Inch Floppy Disk - 320 KB - 1024 bytes/sector'
      }
      9 
      {
        '5 1/4-Inch Floppy Disk - 180 KB - 512 bytes/sector'
      }
      10 
      {
        '5 1/4-Inch Floppy Disk - 160 KB - 512 bytes/sector'
      }
      11 
      {
        'Removable media other than floppy'
      }
      12 
      {
        'Fixed hard disk media'
      }
      13 
      {
        '3 1/2-Inch Floppy Disk - 120 MB - 512 bytes/sector'
      }
      14 
      {
        '3 1/2-Inch Floppy Disk - 640 KB - 512 bytes/sector'
      }
      15 
      {
        '5 1/4-Inch Floppy Disk - 640 KB - 512 bytes/sector'
      }
      16 
      {
        '5 1/4-Inch Floppy Disk - 720 KB - 512 bytes/sector'
      }
      17 
      {
        '3 1/2-Inch Floppy Disk - 1.2 MB - 512 bytes/sector'
      }
      18 
      {
        '3 1/2-Inch Floppy Disk - 1.23 MB - 1024 bytes/sector'
      }
      19 
      {
        '5 1/4-Inch Floppy Disk - 1.23 MB - 1024 bytes/sector'
      }
      20 
      {
        '3 1/2-Inch Floppy Disk - 128 MB - 512 bytes/sector'
      }
      21 
      {
        '3 1/2-Inch Floppy Disk - 230 MB - 512 bytes/sector'
      }
      22 
      {
        '8-Inch Floppy Disk - 256 KB - 128 bytes/sector'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
