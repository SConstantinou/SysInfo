Function Get-WeightGram 
{
  <#
      .SYNOPSIS
      Converts Pounds to Grams

      .DESCRIPTION
      Converts Pounds to Grams

      .PARAMETER Pounds
      number of pounds

      .EXAMPLE
      Get-WeightGram -Pounds Value
      Converts Pounds to Grams

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
    [math]::round($Pounds * 453.592,2)
  }

  Return
}