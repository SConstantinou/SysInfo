Function Get-SizePB 
{
  <#
      .SYNOPSIS
      Converts bytes to Petabytes

      .DESCRIPTION
      Converts bytes to Petabytes

      .PARAMETER Size
      Size in bytes from the system.

      .EXAMPLE
      Get-SizePB -Size Value
      Converts bytes to Petabytes

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
    [math]::round($Size / 1PB,2)
  }

  Return
}
