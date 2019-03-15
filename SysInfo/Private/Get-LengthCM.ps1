Function Get-LengthCM 
{
  <#
      .SYNOPSIS
      Converts inches to cm

      .DESCRIPTION
      Converts inches to cm

      .PARAMETER Inches
      number of inches

      .EXAMPLE
      Get-LengthCM -Inches Value
      Converts inches to cm

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      Float
  #>



  param ([Parameter(Mandatory = $true,HelpMessage = 'Inches coming from system')][float]$Inches)

  if ($Inches -ne '')
  {
    [math]::round($Inches * 2.54,2)
  }

  Return
}
