function Get-RAMDisk {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $RAMDisk = Get-LogicalDisk | Where-Object {$_.DriveType -eq 'RAM Disk'}
    }
    else{

        $RAMDisk = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'RAM Disk'}
    }

    Write-Output $RAMDisk
}