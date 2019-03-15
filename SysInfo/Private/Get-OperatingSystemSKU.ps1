Function Get-OperatingSystemSKU 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-OperatingSystemSKU -Code Value
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
        'Undefined'
      }
      1 
      {
        'Ultimate Edition'
      }
      2 
      {
        'Home Basic Edition'
      }
      3 
      {
        'Home Premium Edition'
      }
      4 
      {
        'Enterprise Edition'
      }
      6 
      {
        'Business Edition'
      }
      7 
      {
        'Windows Server Standard Edition (Desktop Experience installation)'
      }
      8 
      {
        'Windows Server Datacenter Edition (Desktop Experience installation)'
      }
      9 
      {
        'Small Business Server Edition'
      }
      10 
      {
        'Enterprise Server Edition'
      }
      11 
      {
        'Starter Edition'
      }
      12 
      {
        'Datacenter Server Core Edition'
      }
      13 
      {
        'Standard Server Core Edition'
      }
      14 
      {
        'Enterprise Server Core Edition'
      }
      17 
      {
        'Web Server Edition'
      }
      19 
      {
        'Home Server Edition'
      }
      20 
      {
        'Storage Express Server Edition'
      }
      21 
      {
        'Windows Storage Server Standard Edition (Desktop Experience installation)'
      }
      22 
      {
        'Windows Storage Server Workgroup Edition (Desktop Experience installation)'
      }
      23 
      {
        'Storage Enterprise Server Edition'
      }
      24 
      {
        'Server For Small Business Edition'
      }
      25 
      {
        'Small Business Server Premium Edition'
      }
      27 
      {
        'Windows Enterprise Edition'
      }
      28 
      {
        'Windows Ultimate Edition'
      }
      29 
      {
        'Windows Server Web Server Edition (Server Core installation)'
      }
      36 
      {
        'Windows Server Standard Edition without Hyper-V'
      }
      37 
      {
        'Windows Server Datacenter Edition without Hyper-V (full installation)'
      }
      38 
      {
        'Windows Server Enterprise Edition without Hyper-V (full installation)'
      }
      39 
      {
        'Windows Server Datacenter Edition without Hyper-V (Server Core installation)'
      }
      40 
      {
        'Windows Server Standard Edition without Hyper-V (Server Core installation)'
      }
      41 
      {
        'Windows Server Enterprise Edition without Hyper-V (Server Core installation)'
      }
      42 
      {
        'Microsoft Hyper-V Server'
      }
      43 
      {
        'Storage Server Express Edition (Server Core installation)'
      }
      44 
      {
        'Storage Server Standard Edition (Server Core installation)'
      }
      45 
      {
        'Storage Server Workgroup Edition (Server Core installation)'
      }
      46 
      {
        'Storage Server Enterprise Edition (Server Core installation)'
      }
      50 
      {
        'Windows Server Essentials (Desktop Experience installation)'
      }
      63 
      {
        'Small Business Server Premium (Server Core installation)'
      }
      64 
      {
        'Windows Compute Cluster Server without Hyper-V'
      }
      97 
      {
        'Windows RT'
      }
      101 
      {
        'Windows Home'
      }
      103 
      {
        'Windows Professional with Media Center'
      }
      104 
      {
        'Windows Mobile'
      }
      123 
      {
        'Windows IoT (Internet of Things) Core'
      }
      143 
      {
        'Windows Server Datacenter Edition (Nano Server installation)'
      }
      144 
      {
        'Windows Server Standard Edition (Nano Server installation)'
      }
      147 
      {
        'Windows Server Datacenter Edition (Server Core installation)'
      }
      148 
      {
        'Windows Server Standard Edition (Server Core installation)'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
