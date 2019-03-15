function Get-USBController 
{
  <#
      .SYNOPSIS

      Gets the information about the capabilities of a universal
      serial bus (USB) controller.

      .DESCRIPTION

      Gets the information about the capabilities of a universal
      serial bus (USB) controller and converts all codes in
      results into human readable format.

      .PARAMETER ComputerName

      Specifies the computer name or IP Address of the system that
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

      System.Array. Get-USBController can accept a string value to
      determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-USBController returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-USBController

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties.

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-USBController

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-USBController -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/get-usbcontroller
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

  $ClassName = 'Win32_USBController'
  [Collections.ArrayList]$DefaultProperties = 'Name', 'Status', 'Manufacturer', 'SystemName'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName', 'SystemCreationClassName', 'DeviceID', 'PNPDeviceID')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $USBController = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $USBController)
  {
    $_.Availability = Get-Availability -Code ($_.Availability)
    $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode -Code ($_.ConfigManagerErrorCode)
    $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode -Code ($_.PowerManagementCapabilities)
    $_.ProtocolSupported = Get-ProtocolSupported -Code ($_.ProtocolSupported)
    $_.StatusInfo = Get-StatusInfo -Code ($_.StatusInfo)
  }

  Optimize-Output -Object $USBController -Properties $Properties -DefaultProperties $DefaultProperties
}
