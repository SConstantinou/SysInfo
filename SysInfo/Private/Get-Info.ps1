function Get-Info 
{
  <#
      .SYNOPSIS
      Retrieves the information from the system

      .DESCRIPTION
      Retrieves the information from the system according to the
      specified parameters

      .PARAMETER ClassName
      ClassName that will be used

      .PARAMETER ComputerName
      ComputerName or IP Address for remote system

      .PARAMETER Credential
      Credentials that will be used on the remote system

      .PARAMETER Authentication
      Authentication method that will be used

      .PARAMETER Protocol
      Protocol that will be used for connection to remote system

      .PARAMETER Properties
      Properties that will be retrieved from the system

      .EXAMPLE
      Get-Info -ClassName Value -ComputerName Value -Credential Value -Authentication Value -Protocol Value -Properties Value
      Retrieves the information from the system

      .LINK
      https://www.sconstantinou.com

      .INPUTS
      None

      .OUTPUTS
      PSObject
  #>



  param (
    [String]$ClassName,
    [String[]]$ComputerName,
    [PSCredential]$Credential,
    [String]$Authentication,
    [String]$Protocol,
    [String[]]$Properties
  )

  $SessionCreationError = 'Session could not be created'
    
  if ($ComputerName.Count -eq 0) 
  {
    if ($Protocol -eq '') 
    {
      if ($Credential -eq [PSCredential]::Empty) 
      {
        if ($Authentication -eq '') 
        {
          $Info = Get-CimInstance -ClassName $ClassName -Property $Properties | Select-Object -Property $Properties
        }
        else 
        {
          throw 'No need to specifiy authentication on local PC'
        }
      }
      else 
      {
        throw 'Run PowerShell as another user'
      }
    }
    else 
    {
      throw 'Protocol is always DCOM on local PC. No need to use the parameter.'
    }
  }
  else 
  {
    if ($Protocol -eq '') 
    {
      if ($Credential -eq [PSCredential]::Empty) 
      {
        if ($Authentication -eq '') 
        {
          $Info = Get-CimInstance -ClassName $ClassName -ComputerName $ComputerName -Property $Properties | Select-Object -Property $Properties
        }
        else 
        {
          try 
          {
            $Session = New-CimSession -ComputerName $ComputerName -Authentication $Authentication
            $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object -Property $Properties
            $null = Remove-CimSession -CimSession $Session
          }
          catch 
          {
            throw $SessionCreationError
          }
        }
      }
      else 
      {
        try 
        {
          if ($Authentication -eq '') 
          {
            $Session = New-CimSession -ComputerName $ComputerName -Credential $Credential
            $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object -Property $Properties
            $null = Remove-CimSession -CimSession $Session
          }
          else 
          {
            $Session = New-CimSession -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication
            $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object -Property $Properties
            $null = Remove-CimSession -CimSession $Session
          }
        }
        catch 
        {
          throw $SessionCreationError
        }
      }
    }
    else 
    {
      if ($Protocol -eq 'WinRM') 
      {
        $Protocol = 'Wsman'
      }

      if ($Credential -eq [PSCredential]::Empty) 
      {
        try 
        {
          if ($Authentication -eq '') 
          {
            $SessionProtocolOption = New-CimSessionOption -Protocol $Protocol
            $Session = New-CimSession -ComputerName $ComputerName -SessionOption $SessionProtocolOption
            $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object -Property $Properties
            $null = Remove-CimSession -CimSession $Session
          }
          else 
          {
            $SessionProtocolOption = New-CimSessionOption -Protocol $Protocol
            $Session = New-CimSession -ComputerName $ComputerName -SessionOption $SessionProtocolOption -Authentication $Authentication
            $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object -Property $Properties
            $null = Remove-CimSession -CimSession $Session
          }
        }
        catch 
        {
          throw $SessionCreationError
        }
      }
      else 
      {
        try 
        {
          if ($Authentication -eq '') 
          {
            $SessionProtocolOption = New-CimSessionOption -Protocol $Protocol
            $Session = New-CimSession -ComputerName $ComputerName -SessionOption $SessionProtocolOption -Credential $Credential
            $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object -Property $Properties
            $null = Remove-CimSession -CimSession $Session
          }
          else 
          {
            $SessionProtocolOption = New-CimSessionOption -Protocol $Protocol
            $Session = New-CimSession -ComputerName $ComputerName -SessionOption $SessionProtocolOption -Credential $Credential -Authentication $Authentication
            $Info = Get-CimInstance -ClassName $ClassName -CimSession $Session -Property $Properties | Select-Object -Property $Properties
            $null = Remove-CimSession -CimSession $Session
          }
        }
        catch 
        {
          throw $SessionCreationError
        }
      }
    }
  }

  Write-Output -InputObject $Info
}
