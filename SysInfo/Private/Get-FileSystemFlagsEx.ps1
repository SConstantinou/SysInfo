Function Get-FileSystemFlagsEx 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-FileSystemFlagsEx -Code Value
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
      1 
      {
        'Case Sensitive Search'
      }
      2 
      {
        'Case Preserved Names'
      }
      4 
      {
        'Unicode On Disk'
      }
      8 
      {
        'Persistent ACLs'
      }
      16 
      {
        'File Compression'
      }
      32 
      {
        'Volume Quotas'
      }
      64 
      {
        'Supports Sparse Files'
      }
      128 
      {
        'Supports Reparse Points'
      }
      256 
      {
        'Supports Remote Storage'
      }
      16384 
      {
        'Supports Long Names'
      }
      32768 
      {
        'Volume Is Compressed'
      }
      524289 
      {
        'Read Only Volume'
      }
      65536 
      {
        'Supports Object IDS'
      }
      131072 
      {
        'Supports Encryption'
      }
      262144 
      {
        'Supports Named Streams'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
