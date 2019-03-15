Function Get-MarkingTechnology 
{
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-MarkingTechnology -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

  param ([Parameter(Mandatory = $true,HelpMessage = 'Code received from the system')][uint16]$Code)

  if ($Code -ne '')
  {
    switch ($Code){
      1 
      {
        'Other'
      }
      2 
      {
        'Unknown'
      }
      3 
      {
        'Electrophotographic LED'
      }
      4 
      {
        'Electrophotographic Laser'
      }
      5 
      {
        'Electrophotographic Other'
      }
      6 
      {
        'Impact Moving Head Dot Matrix 9pin'
      }
      7 
      {
        'Impact Moving Head Dot Matrix 24pin'
      }
      8 
      {
        'Impact Moving Head Dot Matrix Other'
      }
      9 
      {
        'Impact Moving Head Fully Formed'
      }
      10 
      {
        'Impact Band'
      }
      11 
      {
        'Impact Other'
      }
      12 
      {
        'Inkjet Aqueous'
      }
      13 
      {
        'Inkjet Solid'
      }
      14 
      {
        'Inkjet Other'
      }
      15 
      {
        'Pen'
      }
      16 
      {
        'Thermal Transfer'
      }
      17 
      {
        'Thermal Sensitive'
      }
      18 
      {
        'Thermal Diffusion'
      }
      19 
      {
        'Thermal Other'
      }
      20 
      {
        'Electroerosion'
      }
      21 
      {
        'Electrostatic'
      }
      22 
      {
        'Photographic Microfiche'
      }
      23 
      {
        'Photographic Imagesetter'
      }
      24 
      {
        'Photographic Other'
      }
      25 
      {
        'Ion Deposition'
      }
      26 
      {
        'eBeam'
      }
      27 
      {
        'Typesetter'
      }
      default 
      {
        'Invalid Code'
      }
    }
  }

  Return
}
