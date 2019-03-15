Function Get-SizeKB 
{
  <#
      .SYNOPSIS
      Converts bytes to Kilobytes

      .DESCRIPTION
      Converts bytes to Kilobytes

      .PARAMETER Size
      Size in bytes from the system.

      .EXAMPLE
      Get-SizeKB -Size Value
      Converts bytes to Kilobytes

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
    [math]::round($Size / 1KB,2)
  }

  Return
}
