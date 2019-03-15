function Get-PrinterSysInfo 
{
  <#
      .SYNOPSIS

      Gets the information about a device connected to a computer
      running on a Microsoft Windows operating system that can produce
      a printed image or text on paper or other medium.

      .DESCRIPTION

      Gets the information about a device connected to a computer
      running on a Microsoft Windows operating system that can produce
      a printed image or text on paper or other medium and converts
      all codes in results into human readable format.

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

      System.Array. Get-PrinterSysInfo can accept a string value
      to determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-PrinterSysInfo returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties.

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-PrinterSysInfo

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-PrinterSysInfo -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/Get-PrinterSysInfo
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

  $ClassName = 'Win32_Printer'
  [Collections.ArrayList]$DefaultProperties = 'Name', 'ShareName', 'PrinterState', 'PrinterStatus', 'Location', 'SystemName'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName', 'SystemCreationClassName', 'PNPDeviceID')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $PrinterInfo = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $PrinterInfo)
  {
    $MaxSizeSupported = $_.MaxSizeSupported * 1KB

    switch ($MaxSizeSupported){
      {
        $MaxSizeSupported -ge 1MB
      }
      {
        $PrinterInfo | Add-Member -MemberType NoteProperty -Name 'MaxSizeSupportedMB' -Value '' -Force
      }
      {
        $MaxSizeSupported -ge 1GB
      }
      {
        $PrinterInfo | Add-Member -MemberType NoteProperty -Name 'MaxSizeSupportedGB' -Value '' -Force
      }
    }
  }

  foreach ($_ in $PrinterInfo)
  {
    $_.Attributes = Get-AttributesCode -Code ($_.Attributes)
    $_.Availability = Get-Availability -Code ($_.Availability)
    $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode -Code ($_.ConfigManagerErrorCode)
    $_.CurrentCapabilities = Get-CurrentCapabilitiesCode -Code ($_.CurrentCapabilities)
    $_.CurrentLanguage = Get-CurrentLanguage -Code ($_.CurrentLanguage)
    $_.DefaultCapabilities = Get-DefaultCapabilitiesCode -Code ($_.DefaultCapabilities)
    $_.DefaultLanguage = Get-DefaultLanguage -Code ($_.DefaultLanguage)
    $_.DetectedErrorState = Get-DetectedErrorState -Code ($_.DetectedErrorState)
    $_.ExtendedDetectedErrorState = Get-ExtendedDetectedErrorState -Code ($_.ExtendedDetectedErrorState)
    $_.ExtendedPrinterStatus = Get-ExtendedPrinterStatus -Code ($_.ExtendedPrinterStatus)
    $_.LanguagesSupported = Get-LanguagesSupported -Code ($_.LanguagesSupported)
    $_.MarkingTechnology = Get-MarkingTechnology -Code ($_.MarkingTechnology)
    $_.PaperSizesSupported = Get-PaperSizesSupported -Code ($_.PaperSizesSupported)
    $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode -Code ($_.PowerManagementCapabilities)
    $_.PrinterState = Get-PrinterState -Code ($_.PrinterState)
    $_.PrinterStatus = Get-PrinterStatus -Code ($_.PrinterStatus)
    $_.StatusInfo = Get-StatusInfo -Code ($_.StatusInfo)
    if ($_.PSObject.Properties.Name -match 'MaxSizeSupportedMB')
    {
      $_.MaxSizeSupportedMB = Get-SizeMB -Size ($_.MaxSizeSupported)
    }
    if ($_.PSObject.Properties.Name -match 'MaxSizeSupportedGB')
    {
      $_.MaxSizeSupportedGB = Get-SizeGB -Size ($_.MaxSizeSupported)
    }
  }

  Optimize-Output -Object $PrinterInfo -Properties $Properties -DefaultProperties $DefaultProperties
}
