function Get-NetworkDrive {

    [cmdletbinding()]

    param (
        [parameter(ValueFromPipeline = $true)][alias("cn")][String[]]$ComputerName)

    if ($ComputerName -eq ''){

        $NetworkDrive = Get-LogicalDisk | Where-Object {$_.DriveType -eq 'Network Drive'}
    }
    else{

        $NetworkDrive = Get-LogicalDisk -ComputerName $ComputerName | Where-Object {$_.DriveType -eq 'Network Drive'}
    }

    Write-Output $NetworkDrive
}