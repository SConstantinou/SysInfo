function Get-DiskDrive 
{
  <#
      .SYNOPSIS

      Gets a physical disk drive as seen by a computer running
      the Windows operating system.

      .DESCRIPTION

      Gets a physical disk drive as seen by a computer running
      the Windows operating system and converts all codes in results
      into human readable format.

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

      System.Array. Get-DiskDrive can accept a string value to
      determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-DiskDrive returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-DiskDrive

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties.

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-DiskDrive

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-DiskDrive -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/get-diskdrive
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

  $ClassName = 'Win32_DiskDrive'
  [Collections.ArrayList]$DefaultProperties = 'DeviceID', 'Caption', 'Partitions', 'Size', 'Model', 'SystemName'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName', 'SystemCreationClassName', 'PNPDeviceID')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $DiskDrive = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $DiskDrive)
  {
    [uint64]$MaxMediaSize = $_.MaxMediaSize * 1KB
    [uint64]$Size = $_.Size

    if ($_.DefaultBlockSize -ge 1KB) 
    {
      $DiskDrive | Add-Member -MemberType NoteProperty -Name 'DefaultBlockSizeKB' -Value '' -Force
    }

    if ($_.MaxBlockSize -ge 1KB) 
    {
      $DiskDrive | Add-Member -MemberType NoteProperty -Name 'MaxBlockSizeKB' -Value '' -Force
    }

    switch ($MaxMediaSize){
      {
        $MaxMediaSize -ge 1MB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'MaxMediaSizeMB' -Value '' -Force
      }
      {
        $MaxMediaSize -ge 1GB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'MaxMediaSizeGB' -Value '' -Force
      }
      {
        $MaxMediaSize -ge 1TB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'MaxMediaSizeTB' -Value '' -Force
      }
      {
        $MaxMediaSize -ge 1PB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'MaxMediaSizePB' -Value '' -Force
      }
    }

    if ($_.MinBlockSize -ge 1KB) 
    {
      $DiskDrive | Add-Member -MemberType NoteProperty -Name 'MinBlockSizeKB' -Value '' -Force
    }

    switch ($Size){
      {
        $Size -ge 1KB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'SizeKB' -Value '' -Force
      }
      {
        $Size -ge 1MB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'SizeMB' -Value '' -Force
      }
      {
        $Size -ge 1GB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'SizeGB' -Value '' -Force
      }
      {
        $Size -ge 1TB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'SizeTB' -Value '' -Force
      }
      {
        $Size -ge 1PB
      }
      {
        $DiskDrive | Add-Member -MemberType NoteProperty -Name 'SizePB' -Value '' -Force
      }
    }
  }

  foreach ($_ in $DiskDrive)
  {
    $_.Availability = Get-Availability -Code ($_.Availability)
    $_.ConfigManagerErrorCode = Get-ConfigManagerErrorCode -Code ($_.ConfigManagerErrorCode)
    $_.PowerManagementCapabilities = Get-PowerManagementCapabilitiesCode -Code ($_.PowerManagementCapabilities)
    $_.StatusInfo = Get-StatusInfo -Code ($_.StatusInfo)
    if ($_.PSObject.Properties.Name -match 'DefaultBlockSizeKB')
    {
      $_.DefaultBlockSizeKB = Get-SizeKB -Size ($_.DefaultBlockSize)
    }
    if ($_.PSObject.Properties.Name -match 'MaxBlockSizeKB')
    {
      $_.MaxBlockSizeKB = Get-SizeKB -Size ($_.MaxBlockSize)
    }
    if ($_.PSObject.Properties.Name -match 'MinBlockSizeKB')
    {
      $_.MinBlockSizeKB = Get-SizeKB -Size ($_.MinBlockSize)
    }
    if ($_.PSObject.Properties.Name -match 'MaxMediaSizeMB')
    {
      $_.MaxMediaSizeMB = Get-SizeMB -Size ($_.MaxMediaSize * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxMediaSizeGB')
    {
      $_.MaxMediaSizeGB = Get-SizeGB -Size ($_.MaxMediaSize * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxMediaSizeTB')
    {
      $_.MaxMediaSizeTB = Get-SizeTB -Size ($_.MaxMediaSize * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'SizeKB')
    {
      $_.SizeKB = Get-SizeKB -Size ($_.Size)
    }
    if ($_.PSObject.Properties.Name -match 'SizeMB')
    {
      $_.SizeMB = Get-SizeMB -Size ($_.Size)
    }
    if ($_.PSObject.Properties.Name -match 'SizeGB')
    {
      $_.SizeGB = Get-SizeGB -Size ($_.Size)
    }
    if ($_.PSObject.Properties.Name -match 'SizeTB')
    {
      $_.SizeTB = Get-SizeTB -Size ($_.Size)
    }
    if ($_.PSObject.Properties.Name -match 'SizePB')
    {
      $_.SizePB = Get-SizePB -Size ($_.Size)
    }
  }

  Optimize-Output -Object $DiskDrive -Properties $Properties -DefaultProperties $DefaultProperties
}
