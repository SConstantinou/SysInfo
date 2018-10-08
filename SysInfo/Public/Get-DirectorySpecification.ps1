function Get-DirectorySpecification {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    $Properties = ((Get-CimClass -ClassName Win32_DirectorySpecification).CimClassProperties).Name

    if ($ComputerName -eq ''){

        $DirectorySpecification = Get-CimInstance -ClassName Win32_DirectorySpecification -Property $Properties | Select-Object $Properties
    }
    else{

        $DirectorySpecification = Get-CimInstance -ClassName Win32_DirectorySpecification -Property $Properties -ComputerName $ComputerName | Select-Object $Properties
    }

    foreach ($_ in $DirectorySpecification){

        $_.DirectoryType = Get-DirectoryType ($_.DirectoryType)
        $_.SoftwareElementState = Get-SoftwareElementState ($_.SoftwareElementState)
        $_.TargetOperatingSystem = Get-TargetOperatingSystem ($_.TargetOperatingSystem)
    }
    
    Write-Output $DirectorySpecification
}