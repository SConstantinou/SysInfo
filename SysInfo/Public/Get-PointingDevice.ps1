function Get-PointingDevice 
{
  <#
      .SYNOPSIS

      Gets the information about an input device used to point to and
      select regions on the display of a computer system running Windows.

      .DESCRIPTION

      Gets the information about an input device used to point to and
      select regions on the display of a computer system running Windows
      and converts all codes in results into human readable format.
      Output includes any device used to manipulate a pointer, or point
      to the display on a computer system running Windows

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

      System.Array. Get-PointingDevice can accept a string value
      to determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-PointingDevice returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-PointingDevice

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties.

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-PointingDevice

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-PointingDevice -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/get-pointingdevice
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

  $ClassName = 'Win32_PointingDevice'
  [Collections.ArrayList]$DefaultProperties = 'Name', 'Status', 'PointingType', 'DeviceInterface', 'HardwareType', 'Manufacturer', 'SystemName'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName', 'SystemCreationClassName', 'DeviceID', 'PNPDeviceID')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $PointingDevice = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $PointingDevice)
  {
    $_.Availability = Get-Availability -Code ($_.Availability)
    $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode -Code ($_.ConfigManagerErrorCode)
    $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode -Code ($_.PowerManagementCapabilities)
    $_.Handedness = Get-Handedness -Code ($_.Handedness)
    $_.StatusInfo = Get-StatusInfo -Code ($_.StatusInfo)
    $_.DeviceInterface = Get-DeviceInterface -Code ($_.DeviceInterface)
    $_.PointingType = Get-PointingType -Code ($_.PointingType)
  }

  Optimize-Output -Object $PointingDevice -Properties $Properties -DefaultProperties $DefaultProperties
}
