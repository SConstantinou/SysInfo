Function Get-SpeedMbpsConversion 
{
  <#
      .SYNOPSIS
      Converts bps to Mbps

      .DESCRIPTION
      Converts bps to Mbps

      .PARAMETER Speed
      Speed in bps from the system.

      .EXAMPLE
      Get-SpeedKbpsConversionn -Speed Value
      Converts bps to Mbps

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      Uint64
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Speed received from the system')][uint64]$Speed)

  if ($Speed -ne '')
  {
    [math]::round($Speed / 1000000,2)
  }

  Return
}
