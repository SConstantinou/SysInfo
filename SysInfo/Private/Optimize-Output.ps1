Function Optimize-Output 
{
  <#
      .SYNOPSIS
      Optimizes output information

      .DESCRIPTION
      Optimizes output information

      .PARAMETER Object
      Object with the system information

      .PARAMETER Properties
      Properties for the output object

      .PARAMETER DefaultProperties
      Default properties for the output object

      .EXAMPLE
      Optimize-Output -Object Value -Properties Value -DefaultProperties Value
      Optimizes output

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      PSObject
  #>



  param (
    [PSObject]$Object,
    [String[]]$Properties,
    [String[]]$DefaultProperties
  )

    
  function Get-NotePropertiesOnly
  {
    <#
        .SYNOPSIS
        Filters NoteProperties only from the object members

        .DESCRIPTION
        Filters NoteProperties only from the object members

        .PARAMETER Members
        Members from the object

        .EXAMPLE
        Get-NotePropertiesOnly -Members Value
        Filters NoteProperties only from the object members

        .LINK
        https://www.sconstantinou.com

        .INPUTS
        Object

        .OUTPUTS
        Object
    #>


    param
    (
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, HelpMessage = 'Filter Only NoteProperties')]
      $Members
    )
    process
    {
      if ($Members.MemberType -eq 'NoteProperty')
      {
        $Members
      }
    }
  }

  if ($Properties.Count -eq 0) 
  {
    $DefaultProperties = $DefaultProperties | Sort-Object
    Write-Output -InputObject $Object | Select-Object -Property $DefaultProperties
  }
  elseif ($Properties -eq '*') 
  {
    $Properties = ($Object |
      Get-Member |
    Get-NotePropertiesOnly).Name | Sort-Object
    Write-Output -InputObject $Object | Select-Object -Property $Properties
  }
  else
  {
    Write-Output -InputObject $Object | Select-Object -Property $Properties
  }
}
