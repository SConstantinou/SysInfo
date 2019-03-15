Function Get-SpeedKbpsConversion 
{
  <#
      .SYNOPSIS
      Converts bps to Kbps

      .DESCRIPTION
      Converts bps to Kbps

      .PARAMETER Speed
      Speed in bps from the system..

      .EXAMPLE
      Get-SpeedKbpsConversionn -Speed Value
      Converts bps to Kbps

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
    [math]::round($Speed / 1000,2)
  }

  Return
}
