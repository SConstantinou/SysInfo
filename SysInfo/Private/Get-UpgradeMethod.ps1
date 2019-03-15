Function Get-UpgradeMethod 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-UpgradeMethod -Code Value
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
        'Other'
      }
      '2' 
      {
        'Unknown'
      }
      '3' 
      {
        'Daughter Board'
      }
      '4' 
      {
        'ZIF Socket'
      }
      '5' 
      {
        'Replacement/Piggy Back'
      }
      '6' 
      {
        'None'
      }
      '7' 
      {
        'LIF Socket'
      }
      '8' 
      {
        'Slot 1'
      }
      '9' 
      {
        'Slot 2'
      }
      '10' 
      {
        '370 Pin Socket'
      }
      '11' 
      {
        'Slot A'
      }
      '12' 
      {
        'Slot M'
      }
      '13' 
      {
        'Socket 423'
      }
      '14' 
      {
        'Socket A (Socket 462)'
      }
      '15' 
      {
        'Socket 478'
      }
      '16' 
      {
        'Socket 754'
      }
      '17' 
      {
        'Socket 940'
      }
      '18' 
      {
        'Socket 939'
      }
      '19' 
      {
        'Socket mPGA604'
      }
      '20' 
      {
        'Socket LGA771'
      }
      '21' 
      {
        'Socket LGA775'
      }
      '22' 
      {
        'Socket S1'
      }
      '23' 
      {
        'Socket AM2'
      }
      '24' 
      {
        'Socket F (1207)'
      }
      '25' 
      {
        'Socket LGA1366'
      }
      '26' 
      {
        'Socket G34'
      }
      '27' 
      {
        'Socket AM3'
      }
      '28' 
      {
        'Socket C32'
      }
      '29' 
      {
        'Socket LGA1156'
      }
      '30' 
      {
        'Socket LGA1567'
      }
      '31' 
      {
        'Socket PGA988A'
      }
      '32' 
      {
        'Socket BGA1288'
      }
      '33' 
      {
        'rPGA988B'
      }
      '34' 
      {
        'BGA1023'
      }
      '35' 
      {
        'BGA1224'
      }
      '36' 
      {
        'LGA1155'
      }
      '37' 
      {
        'LGA1356'
      }
      '38' 
      {
        'LGA2011'
      }
      '39' 
      {
        'Socket FS1'
      }
      '40' 
      {
        'Socket FS2'
      }
      '41' 
      {
        'Socket FM1'
      }
      '42' 
      {
        'Socket FM2'
      }
      '43' 
      {
        'Socket LGA2011-3'
      }
      '44' 
      {
        'Socket LGA1356-3'
      }
      '45' 
      {
        'Socket LGA1150'
      }
      '46' 
      {
        'Socket BGA1168'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
