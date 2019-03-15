Function Get-SpeedGbpsConversion 
{
  <#
      .SYNOPSIS
      Converts bps to Gbps

      .DESCRIPTION
      Converts bps to Gbps

      .PARAMETER Speed
      Speed in bps from the system.

      .EXAMPLE
      Get-SpeedGbpsConversion -Speed Value
      Converts bps to Gbps

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
    [math]::round($Speed / 1000000000,2)
  }

  Return
}
