function Get-PhysicalMemoryArray 
{
  <#
      .SYNOPSIS

      Gets the details about the computer system physical memory.

      .DESCRIPTION

      Gets the details about the computer system physical memory and
      converts all codes in results into human readable format.
      Output includes the number of memory devices, memory capacity
      available, and memory type

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

      System.Array. Get-PhysicalMemoryArray can accept a string value
      to determine the ComputerName parameter.

      .OUTPUTS

      System.Object. Get-PhysicalMemoryArray returns an object containing
      all the information that has been retrieved.

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray

      This command gets the information from local system

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName Server1

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName "192.168.0.5"

      This command gets the information from remote system with IP 192.168.0.5

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName Server1,Server2,Server3

      This command gets the information from Server1, Server2 and Server3

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName Server1 -Properties Name,Status

      This command gets the information from Server1 and will output only Name
      and Status Properties

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName Server1 -Properties *

      This command gets the information from Server1 and will output all properties

      .EXAMPLE

      PS C:\> "Server1" | Get-PhysicalMemoryArray

      This command gets the information from Server1

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName Server1 -Protocol DCOM

      This command gets the information from Server1 using DCOM protocol

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName Server1 -Credential domain\user

      This command gets the information from Server1 using a different user

      .EXAMPLE

      PS C:\> Get-PhysicalMemoryArray -ComputerName Server1 -Credential domain\user -Authentication Basic

      This command gets the information from Server1 using a different user using basic authentication

      .LINK

      https://www.sconstantinou.com/get-physicalmemoryarray
  #>

  [cmdletbinding()]

  param (
    [parameter(ValueFromPipeline = $true)][alias('cn')][String[]]$ComputerName,
    [alias('cred')][ValidateNotNull()][pscredential][System.Management.Automation.Credential()]$Credential = [pscredential]::Empty,
    [alias('a')][validateset('Default','Digest','Negotiate','Basic','Kerberos','NtlmDomain','CredSsp')][String]$Authentication,
    [alias('p')][validateset('WinRM','DCOM')][String]$Protocol,
    [SupportsWildcards()][alias('Property')][String[]]$Properties
  )

  $ClassName = 'Win32_PhysicalMemoryArray'
  [Collections.ArrayList]$DefaultProperties = 'Name', 'MemoryDevices', 'MaxCapacity', 'Model', 'Tag'

  [Collections.ArrayList]$AllProperties = ((Get-CimClass -ClassName $ClassName).CimClassProperties).Name
  $RemoveProperties = @('CreationClassName')
  foreach ($_ in $RemoveProperties)
  {
    $AllProperties.Remove($_)
  }

  $PhysicalMemoryArray = Get-Info -ClassName $ClassName -ComputerName $ComputerName -Credential $Credential -Authentication $Authentication -Protocol $Protocol -Properties $AllProperties

  foreach ($_ in $PhysicalMemoryArray)
  {
    [uint64]$MaxCapacity = $_.MaxCapacity * 1KB
    [uint64]$MaxCapacityEx = $_.MaxCapacityEx * 1KB

    switch ($MaxCapacity){
      {
        $MaxCapacity -ge 1MB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityMB' -Value '' -Force
      }
      {
        $MaxCapacity -ge 1GB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityGB' -Value '' -Force
      }
      {
        $MaxCapacity -ge 1TB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityTB' -Value '' -Force
      }
      {
        $MaxCapacity -ge 1PB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityPB' -Value '' -Force
      }
    }

    switch ($MaxCapacityEx){
      {
        $MaxCapacityEx -ge 1MB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityExMB' -Value '' -Force
      }
      {
        $MaxCapacityEx -ge 1GB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityExGB' -Value '' -Force
      }
      {
        $MaxCapacityEx -ge 1TB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityExTB' -Value '' -Force
      }
      {
        $MaxCapacityEx -ge 1PB
      }
      {
        $PhysicalMemoryArray | Add-Member -MemberType NoteProperty -Name 'MaxCapacityExPB' -Value '' -Force
      }
    }

    if ($null -ne $_.Depth)
    {
      $PhysicalMemoryArray |
      Add-Member -MemberType NoteProperty -Name 'DepthCM' -Value "$(Get-LengthCM -Inches ($_.Depth))" -Force
    }

    if ($null -ne $_.Height)
    {
      $PhysicalMemoryArray |
      Add-Member -MemberType NoteProperty -Name 'HeightCM' -Value "$(Get-LengthCM -Inches ($_.Height))" -Force
    }

    if ($null -ne $_.Width)
    {
      $PhysicalMemoryArray |
      Add-Member -MemberType NoteProperty -Name 'WidthCM' -Value "$(Get-LengthCM -Inches ($_.Width))" -Force
    }

    if ($null -ne $_.Weight)
    {
      $PhysicalMemoryArray |
      Add-Member -MemberType NoteProperty -Name 'WeightGr' -Value "$(Get-WeightGram -Pounds ($_.Weight))" -Force
    }

    if (($_.PSObject.Properties.Name -match 'WeightGr') -and ($_.WeightGr -ge 1000))
    {
      $PhysicalMemoryArray |
      Add-Member -MemberType NoteProperty -Name 'WeightKg' -Value "$(Get-WeightKg -Pounds ($_.Weight))" -Force
    }
  }

  foreach ($_ in $PhysicalMemoryArray)
  {
    $_.Location = Get-PhysicalMemoryArrayLocation -Code ($_.Location)
    $_.MemoryErrorCorrection = Get-MemoryErrorCorrection -Code ($_.MemoryErrorCorrection)
    $_.Use = Get-PhysicalMemoryArrayUse -Code ($_.Use)
    if ($_.PSObject.Properties.Name -match 'MaxCapacityMB')
    {
      $_.MaxCapacityMB = Get-SizeMB -Size ($_.MaxCapacity * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxCapacityGB')
    {
      $_.MaxCapacityGB = Get-SizeGB -Size ($_.MaxCapacity * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxCapacityTB')
    {
      $_.MaxCapacityTB = Get-SizeTB -Size ($_.MaxCapacity * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxCapacityPB')
    {
      $_.MaxCapacityPB = Get-SizePB -Size ($_.MaxCapacity * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxCapacityExMB')
    {
      $_.MaxCapacityExMB = Get-SizeMB -Size ($_.MaxCapacityEx * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxCapacityExGB')
    {
      $_.MaxCapacityExGB = Get-SizeGB -Size ($_.MaxCapacityEx * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxCapacityExTB')
    {
      $_.MaxCapacityExTB = Get-SizeTB -Size ($_.MaxCapacityEx * 1KB)
    }
    if ($_.PSObject.Properties.Name -match 'MaxCapacityExPB')
    {
      $_.MaxCapacityExPB = Get-SizePB -Size ($_.MaxCapacityEx * 1KB)
    }
  }

  Optimize-Output -Object $PhysicalMemoryArray -Properties $Properties -DefaultProperties $DefaultProperties
}
