Function Get-DetectedErrorState {
  <#
      .SYNOPSIS
      Code lookup table

      .DESCRIPTION
      Checks and converts codes to meaning full information

      .PARAMETER Code
      The code received the the system.

      .EXAMPLE
      Get-DetectedErrorState -Code Value
      Converts code to the associated string value

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      System.String
  #>

    param ([Parameter(Mandatory=$true,HelpMessage='Code received from the system')][uint16]$Code)

    if ($Code -ne ''){

        switch ($Code){
            0 {'Unknown'}
            1 {'Other'}
            2 {'No Error'}
            3 {'Low Paper'}
            4 {'No Paper'}
            5 {'Low Toner'}
            6 {'No Toner'}
            7 {'Door Open'}
            8 {'Jammed'}
            9 {'Offline'}
            10 {'Service Requested'}
            11 {'Output Bin Full'}
            default {'Invalid Code'}
        }
    }

    Return
}