Function Get-SizeGB 
{
  <#
      .SYNOPSIS
      Converts bytes to Gigabytes

      .DESCRIPTION
      Converts bytes to Gigabytes

      .PARAMETER Size
      Size in bytes from the system.

      .EXAMPLE
      Get-SizeGB -Size Value
      Converts bytes to Gigabytes

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      Uint64
  #>



  param ([Parameter(Mandatory = $true,HelpMessage = 'Size in bytes from the system')][uint64]$Size)

  if ($Size -ne '')
  {
    [math]::round($Size / 1GB,2)
  }

  Return
}
