function Get-PhysicalMemory 
{
  <#
      .SYNOPSIS

      Gets the information about a physical memory device located on a
      computer system and available to the operating system.

      .DESCRIPTION

      Gets the information about a physical memory device located on a
      computer system and available to the operating system and converts
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

      System.Array. Get-PhysicalMemory can accept a string value
      to determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-PhysicalMemory returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-PhysicalMemory

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-PhysicalMemory -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PhysicalMemory -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-PhysicalMemory -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\>  Get-NetworkAdapterConfiguration -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties

      .EXAMPLE

      PS C:\>  Get-NetworkAdapterConfiguration -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-PhysicalMemory

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PhysicalMemory -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-PhysicalMemory -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-PhysicalMemory -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/get-physicalmemory
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

  $ClassName = 'Win32_PhysicalMemory'
  [Collections.ArrayList]$DefaultProperties = 'Name', 'PartNumber', 'SerialNumber', 'Speed', 'DeviceLocator', 'Manufacturer', 'Tag', 'SystemName'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $PhysicalMemory = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $PhysicalMemory)
  {
    [uint64]$Capacity = $_.Capacity

    switch ($Capacity){
      {
        $Capacity -gt 1KB
      }
      {
        $PhysicalMemory | Add-Member -MemberType NoteProperty -Name 'CapacityKB' -Value '' -Force
      }
      {
        $Capacity -gt 1MB
      }
      {
        $PhysicalMemory | Add-Member -MemberType NoteProperty -Name 'CapacityMB' -Value '' -Force
      }
      {
        $Capacity -gt 1GB
      }
      {
        $PhysicalMemory | Add-Member -MemberType NoteProperty -Name 'CapacityGB' -Value '' -Force
      }
    }
  }

  foreach ($_ in $PhysicalMemory)
  {
    $_.FormFactor = Get-FormFactor -Code ($_.FormFactor)
    $_.InterleavePosition = Get-InterleavePosition -Code ($_.InterleavePosition)
    $_.MemoryType = Get-MemoryType -Code ($_.MemoryType)
    $_.TypeDetail = Get-TypeDetail -Code ($_.TypeDetail)
    if ($_.PSObject.Properties.Name -match 'CapacityKB')
    {
      $_.CapacityKB = Get-SizeKB -Size ($_.Capacity)
    }
    if ($_.PSObject.Properties.Name -match 'CapacityMB')
    {
      $_.CapacityMB = Get-SizeMB -Size ($_.Capacity)
    }
    if ($_.PSObject.Properties.Name -match 'CapacityGB')
    {
      $_.CapacityGB = Get-SizeGB -Size ($_.Capacity)
    }
  }

  Optimize-Output -Object $PhysicalMemory -Properties $Properties -DefaultProperties $DefaultProperties
}
