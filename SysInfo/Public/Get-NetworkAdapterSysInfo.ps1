function Get-NetworkAdapterSysInfo 
{
  <#
      .SYNOPSIS

      Gets the information about a network adapter of a computer
      running a Windows operating system.

      .DESCRIPTION

      Gets the information about a network adapter of a computer
      running a Windows operating system and converts all
      codes in results into human readable format.Get-NetworkAdapterSysInfo
      only supplies IPv4 data.

      .PARAMETER ComputerName

      Specifies the computer names or IP Addresses of the systems that
      we want to get the information from.

      .PARAMETER Credential

      Specifies the credentials that will be used to get the information
      from remote system.

      .PARAMETER Authentication

      Specifies the authentication that will be used to connect to the
      remote system to get the information from.

      .PARAMETER Protocol

      Specifies the protocol that will be used to get the information
      from the remote system.

      .PARAMETER Properties

      Specifies the object properties that appear in the display and
      the order in which they appear. Wildcards are permitted.

      .INPUTS

      System.Array. Get-NetworkAdapterSysInfo can accept a string value to
      determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-NetworkAdapterSysInfo returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-NetworkAdapterSysInfo

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-NetworkAdapterSysInfo -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-NetworkAdapterSysInfo -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-NetworkAdapterSysInfo -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\>  Get-NetworkAdapterSysInfo -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties

      .EXAMPLE

      PS C:\>  Get-NetworkAdapterSysInfo -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-NetworkAdapterSysInfo

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-NetworkAdapterSysInfo -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-NetworkAdapterSysInfo -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-NetworkAdapterSysInfo -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/Get-NetworkAdapterSysInfo
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

  $ClassName = 'Win32_NetworkAdapter'
  [Collections.ArrayList]$DefaultProperties = 'DeviceID', 'Name', 'AdapterType', 'ServiceName', 'SystemName'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName', 'SystemCreationClassName', 'PNPDeviceID')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $NetworkAdapter = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $NetworkAdapter)
  {
    [uint64]$Speed = $_.Speed

    switch ($Speed){
      {
        $Speed -ge 1000
      }
      {
        $NetworkAdapter | Add-Member -MemberType NoteProperty -Name 'SpeedKbps' -Value '' -Force
      }
      {
        $Speed -ge 1000000
      }
      {
        $NetworkAdapter | Add-Member -MemberType NoteProperty -Name 'SpeedMbps' -Value '' -Force
      }
      {
        $Speed -ge 1000000000
      }
      {
        $NetworkAdapter | Add-Member -MemberType NoteProperty -Name 'SpeedGbps' -Value '' -Force
      }
    }
  }

  foreach ($_ in $NetworkAdapter)
  {
    $_.Availability = Get-Availability -Code ($_.Availability)
    $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode -Code ($_.ConfigManagerErrorCode)
    $_.NetConnectionStatus = Get-NetConnectionStatus -Code ($_.NetConnectionStatus)
    $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode -Code ($_.PowerManagementCapabilities)
    $_.StatusInfo = Get-StatusInfo -Code ($_.StatusInfo)
    if ($_.PSObject.Properties.Name -match 'SpeedKbps')
    {
      $_.SpeedKbps = Get-SpeedKbpsConversion -Speed ($_.Speed)
    }
    if ($_.PSObject.Properties.Name -match 'SpeedMbps')
    {
      $_.SpeedMbps = Get-SpeedMbpsConversion -Speed ($_.Speed)
    }
    if ($_.PSObject.Properties.Name -match 'SpeedGbps')
    {
      $_.SpeedGbps = Get-SpeedGbpsConversion -Speed ($_.Speed)
    }
  }

  Optimize-Output -Object $NetworkAdapter -Properties $Properties -DefaultProperties $DefaultProperties
}
