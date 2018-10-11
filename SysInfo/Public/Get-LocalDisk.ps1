function Get-LocalDisk {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $LocalDisk = Get-LogicalDisk | Where-Object {$_.DriveType -eq 'Local Disk'}
    }
    else{

        $LocalDisk = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'Local Disk'}
    }

    Write-Output $LocalDisk
}