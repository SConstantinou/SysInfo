Function Get-SizeTB 
{
  <#
      .SYNOPSIS
      Converts bytes to Terabytes

      .DESCRIPTION
      Converts bytes to Terabytes

      .PARAMETER Size
      Size in bytes from the system.

      .EXAMPLE
      Get-SizeTB -Size Value
      Converts bytes to Terabytes

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
    [math]::round($Size / 1TB,2)
  }

  Return
}
