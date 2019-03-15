function Get-VideoController 
{
  <#
      .SYNOPSIS

      Gets the information about the capabilities and management
      capacity of the video controller on a computer system
      running Windows.

      .DESCRIPTION

      Gets the information about the capabilities and management
      capacity of the video controller on a computer system
      running Windows and converts all codes in results into
      human readable format. Hardware that is not compatible with
      Windows Display Driver Model (WDDM) returns inaccurate
      property values

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

      System.Array. Get-VideoController can accept a string value to
      determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-VideoController returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-VideoController

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties.

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-VideoController

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-VideoController -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/get-videocontroller
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
  [SupportsWildcards()][alias('Property')][String[]]$Properties)

  $ClassName = 'Win32_VideoController'
  [Collections.ArrayList]$DefaultProperties = 'Name', 'DeviceID', 'VideoProcessor', 'VideoArchitecture', 'AdapterDACType', 'AdapterRAM', 'Status', 'SystemName'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName', 'SystemCreationClassName', 'PNPDeviceID')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $VideoController = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $VideoController)
  {
    [uint64]$AdapterRAM = $_.AdapterRAM

    switch ($AdapterRAM){
      {
        $AdapterRAM -ge 1KB
      }
      {
        $VideoController | Add-Member -MemberType NoteProperty -Name 'AdapterRAMKB' -Value '' -Force
      }
      {
        $AdapterRAM -ge 1MB
      }
      {
        $VideoController | Add-Member -MemberType NoteProperty -Name 'AdapterRAMMB' -Value '' -Force
      }
      {
        $AdapterRAM -ge 1GB
      }
      {
        $VideoController | Add-Member -MemberType NoteProperty -Name 'AdapterRAMGB' -Value '' -Force
      }
    }
  }

  foreach ($_ in $VideoController)
  {
    $_.AcceleratorCapabilities = Get-AcceleratorCapabilitiesCode -Code ($_.AcceleratorCapabilities)
    $_.Availability = Get-Availability -Code ($_.Availability)
    $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode -Code ($_.ConfigManagerErrorCode)
    $_.CurrentScanMode = Get-CurrentScanMode -Code ($_.CurrentScanMode)
    $_.DitherType = Get-DitherType -Code ($_.DitherType)
    $_.ICMIntent = Get-ICMIntent -Code ($_.ICMIntent)
    $_.ICMMethod = Get-ICMMethod -Code ($_.ICMMethod)
    $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode -Code ($_.PowerManagementCapabilities)
    $_.ProtocolSupported = Get-ProtocolSupported -Code ($_.ProtocolSupported)
    $_.StatusInfo = Get-StatusInfo -Code ($_.StatusInfo)
    $_.VideoArchitecture = Get-VideoArchitecture -Code ($_.VideoArchitecture)
    $_.VideoMemoryType = Get-VideoMemoryType -Code ($_.VideoMemoryType)
    if ($_.PSObject.Properties.Name -match 'AdapterRAMKB')
    {
      $_.AdapterRAMKB = Get-SizeKB -Size ($_.AdapterRAM)
    }
    if ($_.PSObject.Properties.Name -match 'AdapterRAMMB')
    {
      $_.AdapterRAMMB = Get-SizeMB -Size ($_.AdapterRAM)
    }
    if ($_.PSObject.Properties.Name -match 'AdapterRAMGB')
    {
      $_.AdapterRAMGB = Get-SizeGB -Size ($_.AdapterRAM)
    }
  }

  Optimize-Output -Object $VideoController -Properties $Properties -DefaultProperties $DefaultProperties
}
