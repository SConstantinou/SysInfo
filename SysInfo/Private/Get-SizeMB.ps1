Function Get-SizeMB 
{
  <#
      .SYNOPSIS
      Converts bytes to Megabytes

      .DESCRIPTION
      Converts bytes to Megabytes

      .PARAMETER Size
      Size in bytes from the system.

      .EXAMPLE
      Get-SizeMB -Size Value
      Converts bytes to Megabytes

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      Uint64
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Size in inches from the system')][uint64]$Size)

  if ($Size -ne '')
  {
    [math]::round($Size / 1MB,2)
  }

  Return
}
