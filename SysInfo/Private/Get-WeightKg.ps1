Function Get-WeightKg 
{
  <#
      .SYNOPSIS
      Converts Pounds to Kilograms

      .DESCRIPTION
      Converts Pounds to Kilograms

      .PARAMETER Pounds
      number of pounds

      .EXAMPLE
      Get-WeightKg -Pounds Value
      Converts Pounds to Kilograms

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      Float
  #>



  param ([Parameter(Mandatory = $true,HelpMessage = 'Pounds coming from the system')][float]$Pounds)

  if ($Pounds -ne '')
  {
    [math]::round($Pounds / 2.205,2)
  }

  Return
}