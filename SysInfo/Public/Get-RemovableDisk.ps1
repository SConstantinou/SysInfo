function Get-RemovableDisk {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $RemovableDisk = Get-LogicalDisk | Where-Object {$_.DriveType -eq 'Removable Disk'}
    }
    else{

        $RemovableDisk = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'Removable Disk'}
    }

    Write-Output $RemovableDisk
}