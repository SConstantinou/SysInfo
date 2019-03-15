Function Get-ChassisType 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-ChassisType -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint16[]]$Code)

  if ($Code.Count -ne 0)
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
        'Desktop'
      }
      4 
      {
        'Low Profile Desktop'
      }
      5 
      {
        'Pizza Box'
      }
      6 
      {
        'Mini Tower'
      }
      7 
      {
        'Tower'
      }
      8 
      {
        'Portable'
      }
      9 
      {
        'Laptop'
      }
      10 
      {
        'Notebook'
      }
      11 
      {
        'Hand Held'
      }
      12 
      {
        'Docking Station'
      }
      13 
      {
        'All in One'
      }
      14 
      {
        'Sub Notebook'
      }
      15 
      {
        'Space-Saving'
      }
      16 
      {
        'Lunch Box'
      }
      17 
      {
        'Main System Chassis'
      }
      18 
      {
        'Expansion Chassis'
      }
      19 
      {
        'SubChassis'
      }
      20 
      {
        'Bus Expansion Chassis'
      }
      21 
      {
        'Peripheral Chassis'
      }
      22 
      {
        'Storage Chassis'
      }
      23 
      {
        'Rack Mount Chassis'
      }
      24 
      {
        'Sealed-Case PC'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
