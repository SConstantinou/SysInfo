Function Get-ProtocolSupported 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ProtocolSupported -Code Value
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
        'EISA'
      }
      4 
      {
        'ISA'
      }
      5 
      {
        'PCI'
      }
      6 
      {
        'ATA/ATAPI'
      }
      7 
      {
        'Flexible Diskette'
      }
      8 
      {
        '1496'
      }
      9 
      {
        'SCSI Parallel Interface'
      }
      10 
      {
        'SCSI Fibre Channel Protocol'
      }
      11 
      {
        'SCSI Serial Bus Protocol'
      }
      12 
      {
        'SCSI Serial Bus Protocol-2 (1394)'
      }
      13 
      {
        'SCSI Serial Storage Architecture'
      }
      14 
      {
        'VESA'
      }
      15 
      {
        'PCMCIA'
      }
      16 
      {
        'Universal Serial Bus'
      }
      17 
      {
        'Parallel Protocol'
      }
      18 
      {
        'ESCON'
      }
      19 
      {
        'Diagnostic'
      }
      20 
      {
        'I2C'
      }
      21 
      {
        'Power'
      }
      22 
      {
        'HIPPI'
      }
      23 
      {
        'MultiBus'
      }
      24 
      {
        'VME'
      }
      25 
      {
        'IPI'
      }
      26 
      {
        'IEEE-488'
      }
      27 
      {
        'RS232'
      }
      28 
      {
        'IEEE 802.3 10BASE5'
      }
      29 
      {
        'IEEE 802.3 10BASE2'
      }
      30 
      {
        'IEEE 802.3 1BASE5'
      }
      31 
      {
        'IEEE 802.3 10BROAD36'
      }
      32 
      {
        'IEEE 802.3 100BASEVG'
      }
      33 
      {
        'IEEE 802.5 Token-Ring'
      }
      34 
      {
        'ANSI X3T9.5 FDDI'
      }
      35 
      {
        'MCA'
      }
      36 
      {
        'ESDI'
      }
      37 
      {
        'IDE'
      }
      38 
      {
        'CMD'
      }
      39 
      {
        'ST506'
      }
      40 
      {
        'DSSI'
      }
      41 
      {
        'QIC2'
      }
      42 
      {
        'Enhanced ATA/IDE'
      }
      43 
      {
        'AGP'
      }
      44 
      {
        'TWIRP (two-way infrared)'
      }
      45 
      {
        'FIR (fast infrared)'
      }
      46 
      {
        'SIR (serial infrared)'
      }
      47 
      {
        'IrBus'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
